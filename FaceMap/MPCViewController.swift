//
//  ViewController.swift
//  Lesc
//
//  Created by Corey Baker on 4/11/16.
//  Copyright © 2016 University of California San Diego - ECE 158B. All rights reserved.
//  Followed and made additions to original tutorial by Gabriel Theodoropoulos - http://www.appcoda.com/intro-multipeer-connectivity-framework-ios-programming/
//

import UIKit
import MultipeerConnectivity

class MPCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MPCManagerDelegate {
    
    let appDelagate = UIApplication.sharedApplication().delegate as! AppDelegate
    var isAdvertising: Bool!
    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var tblPeers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        tblPeers.delegate = self
        tblPeers.dataSource = self
        
        appDelagate.mpcManager.delegate = self
        appDelagate.mpcManager.browser.startBrowsingForPeers()
        appDelagate.mpcManager.advertiser.startAdvertisingPeer()
        isAdvertising = true
        
        UserName.text = myUser.Nickname
        
        // Register cell classes
        tblPeers.registerClass(UITableViewCell.self, forCellReuseIdentifier: "idCellPeer")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UITableView related method implementation
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelagate.mpcManager.foundPeers.count
    }
    
    
    //customizations of tableViewCell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCellPeer")! as UITableViewCell
        cell.textLabel?.text = appDelagate.mpcManager.foundPeers[indexPath.row].displayName
        
        //print("in tableView testing dict")
        //let feels : String
        //feels = appDelagate.mpcManager.dict[appDelagate.mpcManager.foundPeers[indexPath.row]]!
        //print(feels)
        
        
        //let image : UIImage = UIImage(named: feels)!
        //cell.imageView?.image = image
        
        cell.textLabel?.font = UIFont (name: "Avenir Book", size: 20.0)
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedPeer = appDelagate.mpcManager.foundPeers[indexPath.row] as MCPeerID
        
        //TODO: This function is used to send peer info we are interested in
        appDelagate.mpcManager.browser.invitePeer(selectedPeer, toSession: appDelagate.mpcManager.session, withContext: nil, timeout: 20)
       
        
    }
    
    // MARK: MPCManager delegate method implementation
    func foundPeer() {
        tblPeers.reloadData()
    }
    
    func lostPeer() {
        tblPeers.reloadData()
    }
    
    func invitationWasReceived(fromPeer: String) {
        
        
        let alert = UIAlertController(title: "", message: "\(fromPeer) wants to chat with you.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let acceptAction: UIAlertAction = UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default)  {(alertAction) -> Void in
            
            self.appDelagate.mpcManager.invitationHandler(true, self.appDelagate.mpcManager.session)
            print("!!!!!!!!")
            print("Accepted!")
        }
        
        let declineAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {(alertAction) -> Void in
            self.appDelagate.mpcManager.invitationHandler!(false,self.appDelagate.mpcManager.session)
            print("!!!!!!!!")
            print("Declined!")
        }
        
        alert.addAction(acceptAction)
        alert.addAction(declineAction)
        
        NSOperationQueue.mainQueue().addOperationWithBlock{ () -> Void in
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        //TODO: Currently automatically accepting connection. Need to write code on when to accept/deny connection
        //self.appDelagate.mpcManager.invitationHandler!(true, self.appDelagate.mpcManager.session)
    }
    
    func connectedWithPeer(peerID: MCPeerID) {
        NSOperationQueue.mainQueue().addOperationWithBlock{ () -> Void in
            
            print("Done!")
            self.performSegueWithIdentifier("idSegueChat", sender: self)}
        
    }
    
}



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
        
        // Register cell classes
        tblPeers.registerClass(UITableViewCell.self, forCellReuseIdentifier: "idCellPeer")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: IBAction method implementation
    
    /*
    @IBAction func startStopAdvertising(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "", message: "Change Visibility", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var actionTitle: String
        if isAdvertising == true {
            actionTitle = "Make me invisible to others"
        }else {
            
            actionTitle = "Make me visible to others"
        }
        
        let visibilityAction: UIAlertAction = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            if self.isAdvertising == true {
                self.appDelagate.mpcManager.advertiser.stopAdvertisingPeer()
            }else {
                self.appDelagate.mpcManager.advertiser.startAdvertisingPeer()
            }
            
            self.isAdvertising = !self.isAdvertising
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            
        }
        
        actionSheet.addAction(visibilityAction)
        actionSheet.addAction(cancelAction)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    */
    
    // MARK: UITableView related method implementation
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(appDelagate.mpcManager.foundPeers.count)
        return appDelagate.mpcManager.foundPeers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCellPeer")! as UITableViewCell
        //print(appDelagate.mpcManager.foundPeers[indexPath.row].hashValue)
        cell.textLabel?.text = appDelagate.mpcManager.foundPeers[indexPath.row].displayName
        cell.textLabel?.font = UIFont (name: "Avenir Book", size: 18.0)
        
        let image : UIImage = UIImage(named: "angryyellow")!
        cell.imageView?.image = image
        
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
            
        }
        
        let declineAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {(alertAction) -> Void in
            self.appDelagate.mpcManager.invitationHandler!(false,self.appDelagate.mpcManager.session)
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
            
            self.performSegueWithIdentifier("idSegueChat", sender: self)}
        
    }
    
}



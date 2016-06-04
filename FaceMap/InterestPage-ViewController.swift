//
//  InterestPage-ViewController.swift
//  FaceMap
//
//  Created by Vu Truong on 5/3/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit

class InterestPage_ViewController: UIViewController {
    
    var count = 0
    
    var tempbutton1 = 0
    var tempbutton2 = 0
    var tempbutton3 = 0
    
    @IBOutlet weak var womenoutlet: UIButton!
    @IBOutlet weak var menoutlet: UIButton!
    @IBOutlet weak var randomoutlet: UIButton!
    @IBOutlet weak var technologyoutlet: UIButton!
    @IBOutlet weak var sportoutlet: UIButton!
    @IBOutlet weak var musicoutlet: UIButton!
    @IBOutlet weak var movieoutlet: UIButton!
    @IBOutlet weak var entertainmentoutlet: UIButton!
    @IBOutlet weak var policticoutlet: UIButton!
    @IBOutlet weak var educationoutlet: UIButton!
    
    
    @IBAction func movetomap(sender: AnyObject) {
        
        myUser.Interest1 = tempbutton1
        myUser.Interest2 = tempbutton2
        myUser.Interest3 = tempbutton3
        
        self.performSegueWithIdentifier("interesttoconnection", sender: sender)
    }
    
    //function for pressing Button for selection
    func buttonClicked(sender:UIButton)
    {
        
        dispatch_async(dispatch_get_main_queue(), {

            let button = sender as UIButton

            
            if(button.tag != self.tempbutton1 || button.tag != self.tempbutton2 || button.tag != self.tempbutton3){
                
                if(self.tempbutton1 == 0){
                    button.highlighted = true
                    self.count = self.count + 1
                    self.tempbutton1 = button.tag
                    
                    return
                } else if(self.tempbutton1 == button.tag){
                        button.highlighted = false
                        self.count = self.count - 1
                        self.tempbutton1 = 0
                    
                    return
                }
        
                if(self.tempbutton2 == 0){
                    button.highlighted = true
                    self.count = self.count + 1
                    self.tempbutton2 = button.tag
                    
                    return
                } else if(self.tempbutton2 == button.tag){
                    button.highlighted = false
                    self.count = self.count - 1
                    self.tempbutton2 = 0
                    
                    return
                }
                    
                if(self.tempbutton3 == 0){
                    button.highlighted = true
                    self.count = self.count + 1
                    self.tempbutton3 = button.tag
                 
                    return
                }else if(self.tempbutton3 == button.tag){
                    button.highlighted = false
                    self.count = self.count - 1
                    self.tempbutton3 = 0
                    
                    return
                }
            }
            
            if(self.count == 3) {
                self.displayMyAlertMessage("Please, pick your only most 3 interests and Enter")
            }
        
        });
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        educationoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        
        policticoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        entertainmentoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        movieoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        musicoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        sportoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        technologyoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        randomoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        menoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)
        womenoutlet.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked), forControlEvents:.TouchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMyAlertMessage (userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
/*
    // prepare to get the data, suchas userid and display nickname
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        //retrieve destination viewcontroller from segue and cast it to UINavigationcontroller
        let navVc = segue.destinationViewController as! UINavigationController
        
        //cast  first viewcontroller of the uinavigationcontroller as chatviewcontroller
        let chatVc = navVc.viewControllers.first as! ChatViewController
        
        //assign the local id to chatVc.senderId to locate the message
        chatVc.senderId = ref.authData.uid
        
        //display the user nickname in chat room
        chatVc.senderDisplayName = myUser.Nickname
    }
*/
}

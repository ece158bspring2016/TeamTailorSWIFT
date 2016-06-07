//
//  MoodViewController.swift
//  FaceMap
//
//  Created by Vu Truong on 6/4/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit
import Firebase

class MoodViewController: UIViewController {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageZero(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "happyyellow")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)
        
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageOne(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "loveyellow")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)

        
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageTwo(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "wonderful")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)

        
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageThree(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "wink")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)

        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageFour(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "angryyellow")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)

        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageFive(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "boring")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)
        
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageSix(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "tired")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)
        
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageSeven(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "mehyellow")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)
        
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageEight(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "silent")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)
        
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageNine(sender: AnyObject) {
        myUser.Feeling = sender.tag
        appDelegate.mpcManager.updatePeer(myUser.Nickname, feels: "ninja")
        print(appDelegate.mpcManager.peer)
        print(appDelegate.mpcManager.advertiser.discoveryInfo)
        
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
}

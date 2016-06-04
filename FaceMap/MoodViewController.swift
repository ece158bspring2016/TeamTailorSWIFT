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

    
    @IBAction func imageZero(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageOne(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageTwo(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageThree(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageFour(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageFive(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageSix(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageSeven(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageEight(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    @IBAction func imageNine(sender: AnyObject) {
        myUser.Feeling = sender.tag
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

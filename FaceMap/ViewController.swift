//
//  ViewController.swift
//  FaceMap
//
//  Created by Pablo Volpe on 4/15/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // for transition between on/off grid button
    @IBAction func Ongridbutton(sender: AnyObject) {
        self.performSegueWithIdentifier("ongridtoemoji1", sender: sender)
    }
    @IBAction func offgridbutton(sender: AnyObject) {
        self.performSegueWithIdentifier("offgridtoemoji2", sender: sender)
    }
    
    // for transistion between mood and interest in on
    @IBAction func happyimage(sender: UIButton) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func veryhappyimage(sender: UIButton) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func sadimage(sender: UIButton) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func verysadimage(sender: UIButton) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func scaredimage(sender: UIButton) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func frightenimage(sender: AnyObject) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func furious(sender: AnyObject) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func angry(sender: AnyObject) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func depressed(sender: AnyObject) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    @IBAction func excited(sender: AnyObject) {
        self.performSegueWithIdentifier("emojitointerest1", sender: sender)
    }
    
    // transistion between mood and interest in off
    @IBAction func happy1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func veryhappy1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func sad1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func verysad1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func scared(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func frighten1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func furious1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func angry1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func depressed1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    @IBAction func excited1(sender: AnyObject) {
        self.performSegueWithIdentifier("emoji2tointerest2", sender: sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

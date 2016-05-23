//
//  InterestPage-ViewController.swift
//  FaceMap
//
//  Created by Vu Truong on 5/3/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit

class InterestPage_ViewController: UIViewController {
    
    @IBOutlet weak var education: UIButton!
    
    var Ishighlighted : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: UIButtonType.System)
        //button.setTitle("Education", forState: UIControlState.Normal)
        //button.setImage(UIImage(named: "Education") as UIImage?, forState: UIControlState.Normal)
        //button.frame = CGRectMake(0,0,60,60)
        
        self.view.addSubview(button as UIView)
        
        button.addTarget(self, action: #selector(InterestPage_ViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func buttonClicked(sender: UIButton){
        dispatch_async(dispatch_get_main_queue(), {
            if (self.Ishighlighted == false){
                sender.highlighted = true
                self.Ishighlighted = true
            } else {
                sender.highlighted = false
                self.Ishighlighted = false
            }
        })
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  Loginpage-ViewController.swift
//  FaceMap
//
//  Created by Vu Truong on 4/30/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit

class Loginpage_ViewController: UIViewController {

    @IBOutlet weak var userPNlogin: UITextField!
    
    
    @IBAction func userLoginButton(sender: AnyObject) {
        let userNN = userPNlogin.text
        let userNNstored = NSUserDefaults.standardUserDefaults().stringForKey("UserPhoneNumber")

        //check if the login field is empty
        if(userNN!.isEmpty)
        {
            displayMyAlertMessage("Please choose your NickName")
            return
        } else {
            self.performSegueWithIdentifier("logintoconnection", sender: sender)
        }
/*
        //the number entered is matched with registered number
        else if(userPNstored == userPN)
        {
            //log in successful
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "userPN")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.performSegueWithIdentifier("logintoconnection", sender: sender)
        }
        //the number entered is not correct
        else
        {
            displayMyAlertMessage("The Number entered was not correct. Please, Re-Enter again or Register")
        }
 */
    }

    //alert message function
    func displayMyAlertMessage(userMessage: String)
    {
        var myAlert = UIAlertController(title:"Alert",message: userMessage,preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

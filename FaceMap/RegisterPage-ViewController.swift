//
//  RegisterPage-ViewController.swift
//  FaceMap
//
//  Created by Vu Truong on 4/28/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit

class RegisterPage_ViewController: UIViewController {

    @IBOutlet weak var userPNTextField: UITextField!
  
    @IBOutlet weak var userNNTextField: UITextField!
    
    
    @IBAction func RegisterButton(sender: AnyObject) {
        let userPN = userPNTextField.text
        let userNN = userNNTextField.text
        
        //check for empty field
        if(userPN!.isEmpty || userNN!.isEmpty)
        {
            //display alert message and return
            displayMyAlertMessage("All field are required")
            
            return
        }
        
        //save and store data - within the device(not database)
        
        NSUserDefaults.standardUserDefaults().setObject(userPN, forKey: "UserPhoneNumber")
        NSUserDefaults.standardUserDefaults().setObject(userNN, forKey: "UserNickName")
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
        //display alert message with confirmation
        var myAlert = UIAlertController(title: "Alert", message: "Registration is sucessful", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    
    //function to display alert message
    func displayMyAlertMessage (userMessage: String)
    {
        var myAlert = UIAlertController(title:"Alert",message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler: nil)
        
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

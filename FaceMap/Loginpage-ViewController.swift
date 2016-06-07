//
//  Loginpage-ViewController.swift
//  FaceMap
//
//  Created by Vu Truong on 4/30/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation
import MapKit
import MultipeerConnectivity


var ref = Firebase(url: "https://sweltering-inferno-8889.firebaseio.com")

class Loginpage_ViewController: UIViewController, CLLocationManagerDelegate {
    
    

    @IBOutlet weak var userPNlogin: UITextField!
    
    let locationManager = CLLocationManager()
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("landingpage laoded")
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        print("loaded")
    }
    
    @IBAction func userLoginButton(sender: AnyObject) {
        let userNN = userPNlogin.text

        //check if the login field is empty
        if(userNN!.isEmpty)
        {
            displayMyAlertMessage("Please choose your NickName")
            return
        } else {
            
            myUser.Nickname = userNN!
            myUser.Feeling = 0
            myUser.Interest1 = 0
            myUser.Interest2 = 0
            myUser.Interest3 = 0
            
            self.performSegueWithIdentifier("logintomood", sender: sender)
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.locationManager.stopUpdatingLocation()
        
        let latestLocation = locations.last
        
        let latitude = String(format: "%.4f", latestLocation!.coordinate.latitude)
        let longitude = String(format: "%.4f", latestLocation!.coordinate.longitude)
        
        myUser.setLocation(latestLocation!.coordinate.latitude,
                           long: latestLocation!.coordinate.longitude)
        
        
        print("Latitude: \(latitude)")
        print("Longitude: \(longitude)")
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //alert message function
    func displayMyAlertMessage(userMessage: String)
    {
        var myAlert = UIAlertController(title:"Alert",message: userMessage,preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
}

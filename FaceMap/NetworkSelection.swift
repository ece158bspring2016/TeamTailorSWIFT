//
//  NetworkSelection.swift
//  FaceMap
//
//  Created by Pablo Volpe on 5/25/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit
import Firebase
import MultipeerConnectivity

class NetworkSelection: UIViewController {
    
    var mpcManager: MPCManager!
    
    @IBAction func onGridPressed(sender: AnyObject) {
        ref.authAnonymouslyWithCompletionBlock { error, authData in
            if error != nil {
                // There was an error logging in anonymously
            } else {
                // We are now logged in
                
                let usersRef = ref.childByAppendingPath("users")
                let uid = authData.uid
                
                let userData = ["Nickname": myUser.Nickname,
                    "Feeling": myUser.Feeling,
                    "Interest1": myUser.Interest1,
                    "Interest2": myUser.Interest2,
                    "Interest3": myUser.Interest3,
                    "Latitude": myUser.Latitude,
                    "Longitude": myUser.Longitude,
                    "Report Count": myUser.reportCount]
                //"token": authData.token]
                
                usersRef.childByAppendingPath(uid!).setValue(userData)
            }
        }
        performSegueWithIdentifier("ongridtomap", sender: sender)
    }
    
    @IBAction func offGridPressed(sender: UIButton) {
        
    }
    
}

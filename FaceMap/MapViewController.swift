//
//  MapViewController.swift
//  FaceMap
//
//  Created by Pablo Volpe on 6/2/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var users = [User]()

    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         print("MapView page loaded")
        
        // Do any additional setup after loading the view.

        
        let initialLocation = CLLocation(latitude: myUser.Latitude, longitude: myUser.Longitude)
        centerMapOnLocation(initialLocation)
        
        let newUser = User( uid: myUser.uid,
                            Nickname: myUser.Nickname,
                            Feeling: myUser.Feeling,
                            Interest1: myUser.Interest1,
                            Interest2: myUser.Interest2,
                            Interest3: myUser.Interest3,
                            Latitude: myUser.Latitude,
                            Longitude: myUser.Longitude)
        
        mapView.addAnnotation( newUser )
        
        
        // retrieve all user information for map
        loadUsers(myUser.uid)

    }
    

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    
    func loadUsers(myUid: String) {
        
        let usersRef = ref.childByAppendingPath("users")
        
        usersRef.observeEventType(.Value, withBlock: { snapshot in
            // do some stuff once
            
            for user in snapshot.children {
                
                let uid = "cool"
                let Nickname = user.value["Nickname"] as? String
                let Feeling = user.value["Feeling"] as? Int
                let Interest1 = user.value["Interest1"] as? Int
                let Interest2 = user.value["Interest2"] as? Int
                let Interest3 = user.value["Interest3"] as? Int
                let Latitude = user.value["Latitude"] as? Double
                let Longitude = user.value["Longitude"] as? Double
                
                let newUser = User( uid: uid,
                    Nickname: Nickname!,
                    Feeling: Feeling!,
                    Interest1: Interest1!,
                    Interest2: Interest2!,
                    Interest3: Interest3!,
                    Latitude: Latitude!,
                    Longitude: Longitude!)
                
                self.users.append(newUser)
            }
            
            self.mapView.addAnnotations( self.users )

            
        })
    }
    
}

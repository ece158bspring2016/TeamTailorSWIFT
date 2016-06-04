//
//  User.swift
//  FaceMap
//
//  Created by Pablo Volpe on 5/25/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import Foundation
import MapKit


var myUser = User()

class User: NSObject, MKAnnotation {
    
    // MKAnnotation
    //var title: String
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    var uid: String
    var Nickname: String
    var Feeling: Int
    var Interest1: Int
    var Interest2: Int
    var Interest3: Int
    var Latitude: Double
    var Longitude: Double
    var reportCount: Int

    
    
    
    override init () {
        
        self.uid = ""
        self.Nickname = ""
        self.Feeling = 0
        self.Interest1 = 0
        self.Interest2 = 0
        self.Interest3 = 0
        self.Latitude = 0.0
        self.Longitude = 0.0
        
        coordinate = CLLocationCoordinate2D(latitude: Latitude, longitude: Longitude)
        
        
        reportCount = 0
        
        super.init()
    }
    
    init (uid: String, Nickname: String, Feeling: Int, Interest1: Int, Interest2: Int, Interest3: Int, Latitude: Double, Longitude: Double ) {
        
        self.uid = uid
        self.Nickname = Nickname
        self.Feeling = Feeling
        self.Interest1 = Interest1
        self.Interest2 = Interest2
        self.Interest3 = Interest3
        self.Latitude = Latitude
        self.Longitude = Longitude
        
        // MKAnnotation
        self.title = Nickname
        coordinate = CLLocationCoordinate2D(latitude: Latitude, longitude: Longitude)
        
        
    
        reportCount = 0
        
        super.init()
    }
    
    func setLocation(lat: Double, long: Double) {
        
        Latitude = lat
        Longitude = long
        coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
}


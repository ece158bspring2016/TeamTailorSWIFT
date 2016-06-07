//
//  VCMapView.swift
//  FaceMap
//
//  Created by Pablo Volpe on 6/2/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import Foundation

import MapKit


extension MapViewController: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? User {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView


            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                
                
                button = UIButton(type: .DetailDisclosure)
                button.setTitle("ButtonConnection", forState: .Normal)
                view.rightCalloutAccessoryView = button as UIView
                
                
                
                //view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
           
            }
            return view
        }
        return nil
    }
    
    
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            performSegueWithIdentifier("chatRoom", sender: view)
        }
    }
    
   /* func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!,
                 calloutAccessoryControlTapped control: UIControl!) {
        let location = view.annotation as! User
        
        let name = location.title
        
        let uid = findUserIDByNickname(name!)
        
        print(uid)
        
        //let chat = ChatSession(uid1: myUser.uid, uid2: uid)
        
        //self.performSegueWithIdentifier("chatRoom", sender: view)
        
    }*/
    
 
}
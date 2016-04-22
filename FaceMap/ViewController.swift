//
//  ViewController.swift
//  FaceMap
//
//  Created by Pablo Volpe on 4/15/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        enum Icon{
            case happy
            case veryhappy
            case sad
            case verysad
            case verysad2
            case scared
            case frighten
            case angry
            case furious
            case depressed
            case excited
            
            var image: UIImage {
                switch self {
                case .happy: return UIImage (named: "happy.png")!
                case .veryhappy: return UIImage (named: "veryhappy.png")!
                case .sad: return UIImage (named: "sad.png")!
                case .verysad: return UIImage (named: "verysad.png")!
                case .verysad2: return UIImage (named: "verysad2.png")!
                case .scared: return UIImage (named: "scared.png")!
                case .frighten: return UIImage  (named: "frighten.png")!
                case .angry: return UIImage (named: "angry.png")!
                case .furious: return UIImage (named: "furiouspng")!
                case .depressed: return UIImage (named: "depressed.png")!
                case .excited: return UIImage (named: "excited.png")!
                    
                }
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

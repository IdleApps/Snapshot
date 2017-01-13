//
//  ViewController.swift
//  Snapshot
//
//  Created by Luke Cheskin on 11/01/2017.
//  Copyright © 2017 IdleApps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet var accessToCameraButton: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) ==  AVAuthorizationStatus.authorized {
            
            accessToCameraButton.setTitle("Camera access enabled!", for: .normal)
            accessToCameraButton.tintColor = UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
        
    }
    
    
    @IBAction func allowAccessToCamera(_ sender: Any) {
        
        if AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) != AVAuthorizationStatus.authorized {
            
            guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                })
            }
        }
        
    }
    
    
    
    
    @IBAction func getStartedAction(_ sender: Any) {
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = accessToCameraButton.center
        transition.circleColour = accessToCameraButton.backgroundColor!
        
        return transition
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .dismiss
        transition.startingPoint = accessToCameraButton.center
        transition.circleColour = accessToCameraButton.backgroundColor!
        
        return transition
        
    }
    
    
    
}

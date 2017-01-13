//
//  SecondViewController.swift
//  Snapshot
//
//  Created by Luke Cheskin on 12/01/2017.
//  Copyright © 2017 IdleApps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var dismissView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dismissView.layer.cornerRadius = dismissView.frame.size.width / 2
        
    }
    
    
    @IBAction func dismissViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
    

}

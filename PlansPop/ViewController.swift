//
//  ViewController.swift
//  PlansPop
//
//  Created by Aplimovil on 12/8/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        self.navigationController?.navigationBarHidden = true

        let currentUser = PFUser.currentUser()
        if currentUser != nil {
            super.viewDidLoad()
        }else{
            self.performSegueWithIdentifier("log_out", sender: self)
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func log_out(sender: AnyObject) {
        
        PFUser.logOut()
        
        self.performSegueWithIdentifier("log_out", sender: self)
        
        
    }

}


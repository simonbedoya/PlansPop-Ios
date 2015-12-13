//
//  RegisterViewController.swift
//  PlansPop
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet var email: UITextField!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBarHidden = false
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
    @IBAction func next_check_email(sender: AnyObject) {
        
        let query = PFQuery(className: "User")
        
        let email_t = email.text
        
        if (email_t?.utf16.count == 0){
        
            let alert:UIAlertController = UIAlertController(title: "Invalid", message: "Please, Insert a valid email address.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let actionOK:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            alert.addAction(actionOK)
            
            presentViewController(alert, animated: true, completion: nil)
            
        }else if (validate(email.text!) == true){
            
        print("correcto email")
        
        query.whereKey("email", equalTo: email.text!)
        
            query.findObjectsInBackgroundWithBlock{(objects: [PFObject]?, error: NSError?) -> Void in
            
            
                if error != nil {
                
                    let alert:UIAlertController = UIAlertController(title: "Invalid", message: "Please, The email \(self.email.text) already registered.", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    let actionOK:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                    
                    alert.addAction(actionOK)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                
                }else if (objects?.count == 0){
                    print(objects?.count)
                    self.performSegueWithIdentifier("register_2", sender: self)
                    
                }else{
                    let alert:UIAlertController = UIAlertController(title: "Invalid", message: "Please, The email \(self.email.text) already registered.", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    let actionOK:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                    
                    alert.addAction(actionOK)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                
                }
            }
            
            
        }else{
            print("Email incorrecto")
            let alert:UIAlertController = UIAlertController(title: "Invalid", message: "Please, Insert a valid email address.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let actionOK:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            alert.addAction(actionOK)
            
            presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func validate(YourEMailAddress: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluateWithObject(YourEMailAddress)
    }

}

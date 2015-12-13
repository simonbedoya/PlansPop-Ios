//
//  Register_2ViewController.swift
//  PlansPop
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit


class Register_2ViewController: UIViewController {

    @IBOutlet var birthd: UITextField!
    @IBOutlet var selection_sex: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func birthdate(sender: AnyObject) {
        DatePickerDialog().show("DatePickerDialog", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .Date) {
            (date) -> Void in
            var fecha_c = [String]()
            let date = String(date)
            fecha_c = date.componentsSeparatedByString(" ")
            self.birthd.text = fecha_c[0]

           
        }
        
    }
    @IBAction func change_sex(sender: AnyObject) {
        var sex:String = "Mujer"
        
        switch selection_sex.selectedSegmentIndex {
        case 0:
            sex = "Mujer"
        case 1:
            sex = "Hombre"
        default:
            break
        
        }
        print(sex)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

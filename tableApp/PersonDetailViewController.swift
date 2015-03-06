//
//  PersonDetailViewController.swift
//  tableApp
//
//  Created by Robert Klein on 3/1/15.
//  Copyright (c) 2015 Robert Klein. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate {
    

    
    
    
    
    var selectedPerson = Person(firstName: "Joe", lastName: "Jonas")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedPerson.firstName
        

        // Do any additional setup after loading the view.
    }
   // func textFieldShouldReturn(textFiend: UITextField) -> Bool {
   //     textField.resignFirstResponder()
     //   return true
   // }

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

}

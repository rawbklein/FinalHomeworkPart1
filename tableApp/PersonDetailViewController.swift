//
//  PersonDetailViewController.swift
//  tableApp
//
//  Created by Robert Klein on 3/1/15.
//  Copyright (c) 2015 Robert Klein. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var firstName: UITextField!

    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var selectedPerson = Person(firstName: "Joe", lastName: "Jonas")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.title = self.selectedPerson.firstName
            self.firstName.text = self.selectedPerson.firstName
            self.lastName.text = self.selectedPerson.lastName
            self.firstName.delegate = self
            self.lastName.delegate = self
        
            if self.selectedPerson.image != nil {
                self.imageView.image = self.selectedPerson.image
        }
// Do any additional setup after loading the view.
    }
    
       override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectedPerson.firstName = self.firstName.text
        self.selectedPerson.lastName = self.lastName.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //this line dismisses the keyboard!
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func photosButtonPressed(sender: AnyObject) {
    
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        self.imageView.image = image
        self.selectedPerson.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
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

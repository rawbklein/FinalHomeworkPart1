//
//  Person.swift
//  tableApp
//
//  Created by Robert Klein on 2/26/15.
//  Copyright (c) 2015 Robert Klein. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
    var firstName = "John"
    var lastName = "Doe"
    var image : UIImage?
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        if let image = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = image
        }
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        if self.image != nil {
            aCoder.encodeObject(self.image, forKey: "image")
        }
    }
    // confrom to NScoding protocol via init and encode  this allows to be saved!
    
    
}
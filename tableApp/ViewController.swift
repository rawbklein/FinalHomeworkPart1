//
//  ViewController.swift
//  tableApp
//
//  Created by Robert Klein on 2/26/15.
//  Copyright (c) 2015 Robert Klein. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var people = [Person]() //array with person object empty
    
    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if let count = userDefaults.objectForKey("launchCount") as? Int {
            let newCount = count + 1
            userDefaults.setObject(newCount, forKey: "launchCount")
        } else {
            let count = 1
            userDefaults.setObject(count, forKey: "launchCount")
        }
        userDefaults.synchronize()
        
        self.loadFromArchive()
        
        if self.people.isEmpty {
            if let filePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist") {
                if let plistArray = NSArray(contentsOfFile: filePath) {
                    for personObject in plistArray {
                if let personDictionary = personObject as? NSDictionary {
                    let firstName = personDictionary["firstName"] as String
                    let lastName = personDictionary["lastName"] as String
                    let person = Person(firstName: firstName, lastName: lastName)
                    self.people.append(person)
                }
                }
                } else {
            }
        }
            self.saveToArchive()
        }
         self.tableView.dataSource = self
    }
    
     
        func loadFromArchive() {
            let path = getDocumentsPath()
            let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(path + "/MyArchive") as [Person]
            self.people = arrayFromArchive
        }
            
        func saveToArchive() {
                    let path = self.getDocumentsPath()
                    NSKeyedArchiver.archiveRootObject(self.people, toFile: path + "/MyArchive")
                    }
        
        func getDocumentsPath() -> String {
            let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
            let path = paths.first as String
            return path
        }

       
//        self.tableView.backgroundColor = UIColor.yellowColor()
//        self.title = "homePage"
//        self.tableView.delegate = self
    
       /* var rob = Person(firstName: "Rob", lastName: "Klein")
        var steven = Person(firstName: "Steven", lastName: "Palmer")
        var viole = Person(firstName: "Viole", lastName: "Von Krause")
        var mum = Person(firstName: "Ur", lastName: "Mum")
        var man = Person(firstName: "Little", lastName: "Man")
      //  self.people.append(rob)
        self.people += [steven,rob, viole, mum ,man]
        
        // Do any additional setup after loading the view, typically from a nib. */
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.saveToArchive()
        self.tableView.reloadData()
    }
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.people.count
        }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonCell
        let personToDisplay = self.people[indexPath.row]
////        //cell.textLabel?.text = personToDisplay.firstName + " " + personToDisplay.lastName //NAME NOT NAMES NOT SURE
        cell.personLabel.text = personToDisplay.firstName
        
       if personToDisplay.image != nil {
           cell.personImageView.image = personToDisplay.image
       } else {
            cell.personImageView.image = UIImage(named: "kitties.jpeg")
        }
        
        return cell
    }
        
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PersonDetailViewController" { // checks segue code!
            let destinationVC = segue.destinationViewController as PersonDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            var person = self.people[indexPath!.row]
            
            destinationVC.selectedPerson = person
        }
    }
}

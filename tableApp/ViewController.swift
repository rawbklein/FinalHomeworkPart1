//
//  ViewController.swift
//  tableApp
//
//  Created by Robert Klein on 2/26/15.
//  Copyright (c) 2015 Robert Klein. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var people = [Person]() //array with person object empty
    
    //var names = ["Rob", "Steven", " notRob", "notSteven", "Sawkpuppet", "Rob2", "Steven2", " notRob2", "notSteven2", "Sawkpuppet2", "Rob3", "Steven3", " notRob3", "notSteven3", "Sawkpuppet3",]
    
   
    
    @IBOutlet weak var tableView: UITableView!
    //hello

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.yellowColor()
        self.title = "homePage"
        self.tableView.delegate = self
        
        
        var rob = Person(firstName: "Rob", lastName: "Klein")
        var steven = Person(firstName: "Steven", lastName: "Palmer")
        var viole = Person(firstName: "Viole", lastName: "Von Krause")
        var mum = Person(firstName: "Ur", lastName: "Mum")
        var man = Person(firstName: "Little", lastName: "Man")
      //  self.people.append(rob)
        self.people += [steven,rob, viole, mum ,man]
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PersonDetailViewController" {
        let destinationVC = segue.destinationViewController as PersonDetailViewController
        let indexPath = self.tableView.indexPathForSelectedRow()
        var person = self.people[indexPath!.row]
        destinationVC.selectedPerson = person
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let person = self.people[indexPath.row]
        cell.textLabel?.text = person.firstName + " " + person.lastName //NAME NOT NAMES NOT SURE
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


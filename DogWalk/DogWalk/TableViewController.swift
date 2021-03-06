//
//  TableViewController.swift
//  DogWalk
//
//  Created by Vincent Luu on 26/5/19.
//  Copyright © 2019 Nick Esse. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var sampleDogs:[Dictionary<String, Any>] = [
        [
            "picture": #imageLiteral(resourceName: "pug"),
            "name" : "Ian",
            "breed" : "Breed: Pug",
            "location" : "Location: Darling Harbour"
        ],
        [
            "picture": #imageLiteral(resourceName: "shib"),
            "name" : "Sussan",
            "breed" : "Breed: Shiba Inu",
            "location" : "Location: Pyrmont"
        ],
        [
            "picture": #imageLiteral(resourceName: "Pom"),
            "name" : "Soot",
            "breed" : "Breed: Pomeranian",
            "location" : "Location: Surry Hills"
        ],

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "cell")
        
        print("View did load")

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sampleDogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        let dog = sampleDogs[indexPath.row]
        cell.dogImage.image = dog["picture"] as? UIImage
        cell.nameLabel.text = dog["name"] as? String
        cell.breedLabel.text = dog["breed"] as? String
        cell.locationLabel.text = dog["location"] as? String

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowIndex = tableView.indexPathForSelectedRow![1]
        
        if rowIndex == 0{
            performSegue(withIdentifier: "toPug", sender: self)
        }
        
        if rowIndex == 1{
            performSegue(withIdentifier: "toShib", sender: self)
        }
        
        if  rowIndex == 2{
            performSegue(withIdentifier: "toPom", sender: self)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }

}

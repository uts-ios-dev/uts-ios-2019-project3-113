//
//  ViewController.swift
//  DogWalk
//
//  Created by Nick Esse on 13/5/19.
//  Copyright © 2019 Nick Esse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func introLoginButton(_ sender: Any) {
        performSegue(withIdentifier: "showDynamicListView", sender: self)
    }
    
    
}

// This is DogWalk

// This is new

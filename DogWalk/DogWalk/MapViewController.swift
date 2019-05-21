//
//  MapViewController.swift
//  DogWalk
//
//  Created by Nick Esse on 21/5/19.
//  Copyright © 2019 Nick Esse. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toList(_ sender: Any) {
        performSegue(withIdentifier: "backToList", sender: self)
    }
    
    
    @IBAction func toLogin(_ sender: Any) {
        performSegue(withIdentifier: "backToLoginMap", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

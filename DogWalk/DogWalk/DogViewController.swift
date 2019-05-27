//
//  ViewController.swift
//  Demo
//
//  Created by Harpreet Singh Sokhi on 25/5/19.
//  Copyright © 2019 Harpreet Singh Sokhi. All rights reserved.
//

import UIKit
import MapKit

class DogViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Locate UTS Tower
        let initialLocation = CLLocation(latitude: -33.88361111, longitude: 151.20083333)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
        
        // Show Pug location on map
        let utsTower = DogLocation(title: "Ian", locationName: "UTS Building 1", suburb: "Broadway", discipline: "Pug", coordinate: CLLocationCoordinate2D(latitude: -33.88361111, longitude: 151.20083333))
        mapView.delegate = self as! MKMapViewDelegate
        mapView.addAnnotation(utsTower)
        
        // Show Shiba Inu on map
        let sydneyTower = DogLocation(title: "Sussan", locationName: "Sydney Tower Eye", suburb: "DarlingHarbor", discipline: "Shiba Inu", coordinate: CLLocationCoordinate2D(latitude: -33.870453, longitude: 151.208755))
        mapView.delegate = self as! MKMapViewDelegate
        mapView.addAnnotation(sydneyTower)
    }
}

// Configure annotation
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? DogLocation
            else {
                return nil
        }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        }
        else {
            
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // let location = view.annotation as! DogLocation
        // let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        // location.mapItem().openInMaps(launchOptions: launchOptions)
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "labelViewSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "secondViewSegue")
        {
            performSegue(withIdentifier: "secondViewSegue", sender: nil)
        }
    }
}

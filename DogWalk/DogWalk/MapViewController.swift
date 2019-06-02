//
//  MapViewController.swift
//  DogWalk
//
//  Created by Nick Esse on 21/5/19.
//  Copyright © 2019 Nick Esse. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func unwindToMap(_ sender: UIStoryboardSegue) {}
    
    @IBAction func toList(_ sender: Any) {
        performSegue(withIdentifier: "backToList", sender: self)
    }
    
    @IBAction func toLogin(_ sender: Any) {
        performSegue(withIdentifier: "backToLoginMap", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Locate UTS Tower
        let initialLocation = CLLocation(latitude: -33.88361111, longitude: 151.20083333)
        let regionRadius: CLLocationDistance = 1600
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
        
        // Show Pug location on map
        let Ian = DogLocation(title: "Ian", suburb: "Ultimo", breed: "Pug", coordinate: CLLocationCoordinate2D(latitude: -33.8822, longitude: 151.1970))
        mapView.delegate = self
        mapView.addAnnotation(Ian)
        
        // Show Shiba Inu on map
        let Sussan = DogLocation(title: "Sussan", suburb: "Darlington", breed: "Shiba Inu", coordinate: CLLocationCoordinate2D(latitude: -33.8903, longitude: 151.1966))
        mapView.delegate = self
        mapView.addAnnotation(Sussan)
        
        // Show Shiba Inu on map
        let Soot = DogLocation(title: "Soot", suburb: "Surry Hills", breed: "Pomeranian", coordinate: CLLocationCoordinate2D(latitude: -33.8861, longitude: 151.2111))
        mapView.delegate = self
        mapView.addAnnotation(Soot)
    }
}

// Configure annotation
extension MapViewController: MKMapViewDelegate {
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
        /// For GPRS routing
        // let location = view.annotation as! DogLocation
        // let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        // location.mapItem().openInMaps(launchOptions: launchOptions)
        
        if control == view.rightCalloutAccessoryView && view.annotation?.title == "Ian" {
            performSegue(withIdentifier: "ianSegue", sender: nil)
        }
            
        else if control == view.rightCalloutAccessoryView && view.annotation?.title == "Sussan" {
            performSegue(withIdentifier: "sussanSegue", sender: nil)
        }
            
        else if control == view.rightCalloutAccessoryView && view.annotation?.title == "Soot" {
            performSegue(withIdentifier: "sootSegue", sender: nil)
        }
    }
}

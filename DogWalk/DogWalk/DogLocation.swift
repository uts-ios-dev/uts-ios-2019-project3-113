//
//  DogLocation.swift
//  DogWalk
//
//  Created by Harpreet Singh Sokhi on 2/6/19.
//  Copyright © 2019 Nick Esse. All rights reserved.
//

import Foundation
import MapKit
import Contacts

// Elements for Annotation
class DogLocation: NSObject, MKAnnotation {
    let title: String?
    let suburb: String?
    let breed: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, suburb: String, breed: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.suburb = suburb
        self.breed = breed
        self.coordinate = coordinate
        
        super.init()
    }
    var subtitle: String? {
        return suburb
    }
    
    // Annotation to display this mapitem in map
    func mapItem() -> MKMapItem {
        let address = [CNPostalAddressStreetKey: subtitle!]
        let placeMark = MKPlacemark(coordinate: coordinate, addressDictionary: address)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = title
        
        return mapItem
    }
}

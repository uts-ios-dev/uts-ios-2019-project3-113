//
//  UTSTower.swift
//  Demo
//
//  Created by Harpreet Singh Sokhi on 25/5/19.
//  Copyright © 2019 Harpreet Singh Sokhi. All rights reserved.
//

import Foundation
import MapKit
import Contacts

// Elements for Annotation
class DogLocation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let suburb: String?
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, suburb: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.suburb = suburb
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    var subtitle: String? {
        return locationName
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

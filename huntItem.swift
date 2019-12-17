//
//  huntItem.swift
//  IOS Final
//
//  Created by Gering Dong on 2/13/19.
//  Copyright © 2019 Gering Dong. All rights reserved.
//

import Foundation
import MapKit
import Contacts
import CoreLocation


class huntItems:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    
    let title:String?
    let hint:String?
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    
    init(title: String, hint: String,latitude:Double, longitude:Double){
        self.title = title
        self.hint = hint
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func mapItem()-> MKMapItem{
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    
    
}

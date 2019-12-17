//
//  MapViewController.swift
//  IOS Final
//
//  Created by Gering Dong on 2/13/19.
//  Copyright © 2019 Gering Dong. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    func userLocationStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        else{
            
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userLocationStatus()
        mapView.userTrackingMode = .follow
        mapView.delegate = self
        
        for i in 0..<(singleton_huntItems.sharedInstance.items.count){
            //var i = 0
            let art = huntItems(title: singleton_huntItems.sharedInstance.items[i].title!, hint: singleton_huntItems.sharedInstance.items[i].hint!, latitude:  singleton_huntItems.sharedInstance.items[i].latitude, longitude: singleton_huntItems.sharedInstance.items[i].longitude)
            mapView.addAnnotation(art)
            
        }
    
    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "tab_map_last"{
//            let destinationViewController = segue.destination as! AddGeoViewController
//            destinationViewController
//        }
//    }
//
//
    
}

extension ViewController: MKMapViewDelegate{
    private func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKMarkerAnnotationView?{
        let annotation = annotation as? huntItems
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView{
            dequeuedView.annotation = annotation
            view = dequeuedView
        }else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    private func mapView(_mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessaryControlTapped control: UIControl){
        let location = view.annotation as! huntItems
        let lauchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: lauchOptions)
    }
    
    
}


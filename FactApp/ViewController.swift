//
//  ViewController.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 14/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager!.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager!.delegate = self
        mapView.zoomEnabled = false
        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        
        let coordinates = [
            CLLocationCoordinate2D(latitude: 39.50, longitude: -98.35),
            CLLocationCoordinate2D(latitude: 56.46, longitude: -116.48),
            CLLocationCoordinate2D(latitude: 19.26, longitude: -99.8),
            CLLocationCoordinate2D(latitude: -10, longitude: -55),
            CLLocationCoordinate2D(latitude: 4.19, longitude: 15.9),
            CLLocationCoordinate2D(latitude: 48.52, longitude: 19),
            CLLocationCoordinate2D(latitude: 55.46, longitude: 37.40),
            CLLocationCoordinate2D(latitude: 39.55, longitude: 116.23)
        ]
        
        let coordinates_title = [
            "Estados Unidos da América",
            "Canadá",
            "México",
            "Brasil",
            "Continente Africano",
            "Europa",
            "Russia",
            "China"
        ]
        
        for i in 0..<coordinates.count {
            var point = MKPointAnnotation()
            point.coordinate = coordinates[i]
            point.title = coordinates_title[i] as String
            point.subtitle = "Conheça mais sobre \(coordinates_title[i])"
            mapView.addAnnotation(point)
        }
        
        mapView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        if view.annotation.title == "China" {
            print("Ola")
        }
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "teste")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true
        let t = UIButton(frame: CGRectMake(0, 0, 30, 30))
        t.addTarget(self, action: "btnCheck:", forControlEvents: .TouchUpInside)
        t.backgroundColor = UIColor(patternImage: UIImage(named: "teste")!)
        annotationView.rightCalloutAccessoryView = t
        
        return annotationView
    }
    
    func btnCheck(sender : AnyObject) {
        print(sender)
    }
}


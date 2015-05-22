//
//  TourViewController.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 22/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit
import MapKit

class TourViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations.last)
    }
}

//
//  MapaViewController.swift
//  FactApp
//
//  Created by Guilherme on 26/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var matchingItems: [MKMapItem] = [MKMapItem]()
    var regione = MKCoordinateRegion()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = true
        mapView.showsPointsOfInterest = false
        
        
        buscar()


    }
    
    func buscar() {
        
        regione.center.latitude = self.locationManager.location.coordinate.latitude
        regione.center.longitude = self.locationManager.location.coordinate.longitude
        regione.span = MKCoordinateSpanMake(0.58, 0.58)
        
        matchingItems.removeAll()
        let request = MKLocalSearchRequest()
        
        request.naturalLanguageQuery = "Museum"
        
        mapView.setRegion(regione, animated: true)
        
        request.region = regione
        
        let search = MKLocalSearch(request: request)
        
        search.startWithCompletionHandler({(response:
            MKLocalSearchResponse!,
            error: NSError!) in
            
            if error != nil {
                println("Error occured in search: \(error.localizedDescription)")
            } else if response.mapItems.count == 0 {
                println("No matches found")
            } else {
                println("Matches found")
                
                for item in response.mapItems as! [MKMapItem] {
                    println("Nome = \(item.name)")
                    println("Fone = \(item.phoneNumber)")
                    println("End. = \(item.placemark.title)")
                    
                    self.matchingItems.append(item as MKMapItem)
                    println("Matching items = \(self.matchingItems.count)")
                    
                    var annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.mapView.addAnnotation(annotation)
                }
            }
        })
        
    }


    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse{//esse if verifica se o status é autorizado enquanto o aplicativo esta em primeiro plano
            //se o if for verdadeiro mostraremos a localização do usuario no mapView
            
            if let location = locationManager.location?.coordinate{//centralizamos o mapa na localizacao do usuario
                mapView.setCenterCoordinate(location, animated: true)
                
            } else{
                locationManager.startUpdatingLocation()//caso a localizacao do usuario nao exista estaremos procurando fela atravez desse metodo e esse metodo chama outro o didUpdateLocations em seguida
            }
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locationManager.stopUpdatingLocation()
        
        if let location = locations.last as? CLLocation{
            mapView.setCenterCoordinate(location.coordinate, animated: true)
            mapView.camera.altitude = pow(2,11)
        }
        
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

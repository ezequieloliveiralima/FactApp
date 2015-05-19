//
//  ViewController.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 14/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit
import MapKit
import Foundation

//class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
class ViewController: UIViewController {
    
    //    @IBOutlet weak var mapView: MKMapView!
    //    var locationManager : CLLocationManager!
        var toGo : String = ""
    
    
    @IBOutlet weak var btnUSA: UIButton!
    @IBOutlet weak var btnBrazil: UIButton!
    @IBOutlet weak var btnMexico: UIButton!
    
    @IBOutlet weak var imagemBrasil: UIImageView!
    @IBOutlet weak var imagemEUA: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = hexaToUIColor("73B9FF")
        
        btnBrazil.addTarget(self, action: "btnGo:", forControlEvents: UIControlEvents.TouchUpInside)
        btnMexico.addTarget(self, action: "btnGo:", forControlEvents: UIControlEvents.TouchUpInside)
        btnUSA.addTarget(self, action: "btnGo:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imagemBrasil.alpha = 0
        UIView.animateWithDuration(NSTimeInterval(0.1), animations: {
            self.imagemBrasil.transform = CGAffineTransformMakeScale(1, 1)
        })
        imagemEUA.alpha = 0
        UIView.animateWithDuration(NSTimeInterval(0.1), animations: {
            self.imagemEUA.transform = CGAffineTransformMakeScale(1, 1)
        })

    }
    //        super.viewDidLoad()
    //
    //        self.locationManager = CLLocationManager()
    //        self.locationManager!.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    //        self.locationManager!.delegate = self
    //        mapView.zoomEnabled = false
    //        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    //
    //        let coordinates = [
    //            CLLocationCoordinate2D(latitude: 39.50, longitude: -98.35),
    //            CLLocationCoordinate2D(latitude: 56.46, longitude: -116.48),
    //            CLLocationCoordinate2D(latitude: 19.26, longitude: -99.8),
    //            CLLocationCoordinate2D(latitude: -10, longitude: -55)
    ////            CLLocationCoordinate2D(latitude: 4.19, longitude: 15.9),
    ////            CLLocationCoordinate2D(latitude: 48.52, longitude: 19),
    ////            CLLocationCoordinate2D(latitude: 55.46, longitude: 37.40),
    ////            CLLocationCoordinate2D(latitude: 39.55, longitude: 116.23)
    //        ]
    //
    //        let coordinates_title = [
    //            "Estados Unidos da América",
    //            "Canadá",
    //            "México",
    //            "Brasil"
    ////            "Continente Africano",
    ////            "Europa",
    ////            "Russia",
    ////            "China"
    //        ]
    //
    //        for i in 0..<coordinates.count {
    //            var point = MKPointAnnotation()
    //            point.coordinate = coordinates[i]
    //            point.title = coordinates_title[i] as String
    //            point.subtitle = "Conheça mais sobre \(coordinates_title[i])"
    //            mapView.addAnnotation(point)
    //        }
    //
    //        mapView.delegate = self
    //        // Do any additional setup after loading the view, typically from a nib.
    //    }
    //
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    //
    //    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
    //        toGo = view.annotation.title!
    //    }
    //
    //    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
    //        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "teste")
    //        annotationView.image = UIImage(named: "pin")
    //        annotationView.canShowCallout = true
    //        let t = UIButton(frame: CGRectMake(0, 0, 30, 30))
    //        t.addTarget(self, action: "btnCheck:", forControlEvents: .TouchUpInside)
    //        t.backgroundColor = UIColor(patternImage: UIImage(named: "teste")!)
    //        annotationView.rightCalloutAccessoryView = t
    //
    //        return annotationView
    //    }
    //
    //    override func viewWillDisappear(animated: Bool) {
    //        super.viewWillDisappear(animated)
    //        let notificacao = NSNotificationCenter.defaultCenter()
    //        var message: NSDictionary = NSDictionary(object: toGo, forKey: "title")
    //
    //        notificacao.postNotificationName("WILLGET", object: nil, userInfo: message as [NSObject : AnyObject])
    //    }
    //
    //    func btnCheck(sender : AnyObject) {
    //        NotificationCenter.defaultCenter.selected = toGo
    //
    
    //    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.defaultCenter.selected = toGo
    }
    
    func btnGo(sender : AnyObject) {
        let clicked = sender.tag
        
        switch clicked {
        case 1:
            imagemBrasil.alpha = 1
            println("BR \(sender)")
            toGo = "Brasil"
            UIView.animateWithDuration(NSTimeInterval(1), animations: {
                self.imagemBrasil.transform = CGAffineTransformMakeScale(40, 40)
                }, completion: {
                    (value: Bool) -> Void in
                    self.goToList()
            })
            break
        case 2:
            println("MEXICO")
            break
        case 3:
            println("EUA")
            imagemEUA.alpha = 1
            println("BR \(sender)")
            toGo = "EUA"
            UIView.animateWithDuration(NSTimeInterval(1), animations: {
                self.imagemEUA.transform = CGAffineTransformMakeScale(40, 40)
                }, completion: {
                    (value: Bool) -> Void in
                    self.goToList()
            })
            break
        default:
            break
        }

    }
    
    func goToList() {
        var vc = self.storyboard!.instantiateViewControllerWithIdentifier("Info") as! InfoContinentViewController
        self.navigationController!.pushViewController(vc, animated: true)
    }
}


//
//  ViewController.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 14/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    var toGo : String = ""
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var america: UIImageView!
    @IBOutlet weak var btnUSA: UIButton!
    @IBOutlet weak var btnBrazil: UIButton!
    @IBOutlet weak var btnMexico: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.delegate = self
//        scrollView.minimumZoomScale = 1
//        scrollView.maximumZoomScale = 4
        
        self.view.backgroundColor = hexaToUIColor("73B9FF")
        btnBrazil.addTarget(self, action: "btnGo:", forControlEvents: UIControlEvents.TouchUpInside)
        btnMexico.addTarget(self, action: "btnGo:", forControlEvents: UIControlEvents.TouchUpInside)
        btnUSA.addTarget(self, action: "btnGo:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    override func viewWillAppear(animated: Bool) {
        america.image = UIImage(named: "americas_map")!
        self.america.transform = CGAffineTransformMakeScale(1, 1)
        self.manageButtons(false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.defaultCenter.selected = toGo
    }
    
    func manageButtons(hidden : Bool) {
        btnBrazil.hidden = hidden
        btnMexico.hidden = hidden
        btnUSA.hidden    = hidden
    }
    
    func magic(imageNamed : String) {
        let imagem = UIImageView(image: UIImage(named: imageNamed))
        let maskRef : CGImageRef = imagem.image!.CGImage
        let mask : CGImageRef = CGImageMaskCreate(CGImageGetWidth(maskRef), CGImageGetHeight(maskRef), CGImageGetBitsPerComponent(maskRef), CGImageGetBitsPerPixel(maskRef), CGImageGetBytesPerRow(maskRef), CGImageGetDataProvider(maskRef), nil, false)
        
        let masked : CGImageRef = CGImageCreateWithMask(imagem.image!.CGImage, mask)
        america.image = UIImage(CGImage: masked)
    }
    
    func btnGo(sender : AnyObject) {
        let clicked = sender.tag
        switch clicked {
        case 1:
            toGo = "Brasil"
            magic("BrasilPais")
            break
        case 2:
            toGo = "Mexico"
            magic("MexicoPais")
            break
        case 3:
            toGo = "EUA"
            magic("EUAPais")
            break
        default:
            break
        }
        NSNotificationCenter.defaultCenter().postNotificationName("selected", object: self, userInfo: ["country": toGo])
        america.alpha = 1
        UIView.animateWithDuration(NSTimeInterval(1.5), animations: {
            self.manageButtons(true)
            self.america.transform = CGAffineTransformMakeScale(40, 40)
            }, completion: {
                (value: Bool) -> Void in
                self.goToList()
        })
    }
    
    func goToList() {
        var vc = self.storyboard!.instantiateViewControllerWithIdentifier("Info") as! InfoContinentViewController
        self.navigationController!.pushViewController(vc, animated: false)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
        
//    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
//        return america
//    }
}


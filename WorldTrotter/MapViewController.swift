//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Sriracha Sauce on 8/2/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController{
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()   //create MapView
        view = mapView  //set mapView as this View Controller's view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map View Controller loaded its view...")
    }
}

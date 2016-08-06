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
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satelite"])    //create segment controll with 3 options
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)    //set background color and transparency
        segmentedControl.selectedSegmentIndex = 0   //initial selected option
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false  //turn this off because we are using Auto Layout
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)  //constraint the top anchor to top layout guide
        //let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)  //constraint the leading anchor to the root view's leading anchor
        //let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)   //constraint the trailing anchor to the root view's trailing anchor
        let margins = view.layoutMarginsGuide   //get layout margins of this View Controller's view
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)//constraint the leading edge to margin
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)//constraint the trailing edge to margin
        topConstraint.active = true //these constraints must be activated before they can have any effect
        leadingConstraint.active = true
        trailingConstraint.active = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map View Controller loaded its view...")
    }
    
    func mapTypeChanged(segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
}

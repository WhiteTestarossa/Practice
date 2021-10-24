//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Daniel Belokursky on 24.10.21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        self.view = mapView
    }
    
}

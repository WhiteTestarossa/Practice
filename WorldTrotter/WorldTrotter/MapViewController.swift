//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Daniel Belokursky on 24.10.21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    //Public Properties
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    
    
    //MARK: - LoadView()
    override func loadView() { //FIX(?)
        mapView = MKMapView()
        self.view = mapView
    }
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: SegmentedControl
        let segmentedControl = UISegmentedControl(items: ["Standart", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        self.view.addSubview(segmentedControl)
        
        //MARK: Constraints for SC
        let margins = self.view.layoutMarginsGuide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8.0)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        UserLocation()
    }
    
    //MARK: - Actions
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    //MARK: - Methods
    func UserLocation() {
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    //MARK: - MapView Delegate Methods
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
}

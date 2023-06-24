//
//  LocationManager.swift
//  Weather-Kit
//
//  Created by Oumayma Guefrej on 23/06/2023.
//

import Foundation
import CoreLocation

// This manager allow to get user current locations
class LocationsManager: NSObject, CLLocationManagerDelegate {
    
    //MARK: - Private properties
    private var locationManager: CLLocationManager?
    
    //MARK: - Properties
    var onLocationChangedCallback: () -> () = {}
    static let shared =  LocationsManager()
    var userLocation: CLLocation?

    //MARK: - init
    override init() {
        super.init()
        determineMyCurrentLocation()
    }
    //MARK: - Private method
    private func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
    }
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        userLocation = location
        locationManager?.stopUpdatingLocation()
        onLocationChangedCallback()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManager?.startUpdatingLocation()
    }
    
}

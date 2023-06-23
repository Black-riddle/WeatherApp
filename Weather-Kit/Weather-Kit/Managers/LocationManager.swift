//
//  LocationManager.swift
//  Weather-Kit
//
//  Created by Oumayma Guefrej on 23/06/2023.
//

import Foundation
import CoreLocation

class LocationsManager: NSObject, CLLocationManagerDelegate {
    
    static let shared =  LocationsManager()
    var userLocation: CLLocation?
    var latitude: Double? {
        return userLocation?.coordinate.latitude
    }
    var longitude: Double? {
        return userLocation?.coordinate.longitude
    }
    private var locationManager: CLLocationManager?
    
    var onLocationChangedCallback: () -> () = {}
    @Published var isLoading = false
    
    override init() {
        super.init()
        determineMyCurrentLocation()
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
    }
    
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

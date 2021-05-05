//
//  LocationManager.swift
//  iOSweatherApp
//
//  Created by 지원 on 2021/05/05.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    static let shared = LocationManager()
    private override init() {
        manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        super.init()
        
        manager.delegate = self
    }
    
    let manager: CLLocationManager
    
    var currentLocationTitle: String?
    
    func updateLocation() {
        let status: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            status = manager.authorizationStatus
        } else {
            // 14.0 이하 버전에서
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .notDetermined:
            requestAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            requestCurrentLocation()
        case .denied, .restricted:
            print("not avaliable")
        default:
            print("unknown")
            
        }
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    private func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    private func requestCurrentLocation() {
        manager.requestLocation()
    }
    
    private func updateAddress (from location: CLLocation) {
        // 전달받은 좌표를 문자열로 변환하는 것 : Reverse Geocoding
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            if let error = error {
                print(error)
                self?.currentLocationTitle = "Unknown"
                return
            }
            
            if let placemark = placemarks?.first {
                if let gu = placemark.locality, let dong = placemark.subLocality {
                    self?.currentLocationTitle = "\(gu) \(dong)"
                } else {
                    self?.currentLocationTitle = placemark.name ?? "Unknown"
                }
            }
            
            print(self?.currentLocationTitle)
        }
    }
    
    @available(iOS 14.0, *)
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            requestCurrentLocation()
        case .notDetermined, .denied, .restricted:
            print("not available")
        default:
            print("unknown")
        }
    }
    
    // 14.0 이하에서도 동작하게 하기 위해 이전 버전에서 사용하던 delegate method 추가
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            requestCurrentLocation()
        case .notDetermined, .denied, .restricted:
            print("not available")
        default:
            print("unknown")
        }
    }
    
    // 위치정보가 업데이트되면 (새로운 위치가 전달되면) 반복적으로 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations.last)
        
        if let location = locations.last {
            updateAddress(from: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

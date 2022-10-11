//
//  ManagerDirections.swift
//  Campus
//
//  Created by Kevin Kelly on 10/10/22.
//

import Foundation
import MapKit
import SwiftUI

extension MapManager
{
    func directions(to building: FavoritedBuilding)
    {
        getExpectedTime(to: building)
        self.headingAngle = String(format: "%.2f", Double(Angle(radians: headingAngle(to: building)).degrees))
    }
    
    
    
    
    func getExpectedTime(to building: FavoritedBuilding)
    {
        self.expectedTime = "Loading..."
        
        let request = MKDirections.Request()
        request.source = MKMapItem.forCurrentLocation()
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: building.building.cLLocCoord2D))
        request.transportType = .walking
        request.requestsAlternateRoutes = false
                
        let directions = MKDirections(request: request)
        
        directions.calculateETA
        {
            response, error in
            
            if let eta = response?.expectedTravelTime
            {
                let formatter = DateComponentsFormatter()
                
                self.expectedTime = formatter.string(from: eta) ?? "Time not found"
            }
            else
            {
                self.expectedTime = "Time not found"
            }
        }
    }
    
    func headingAngle(to: FavoritedBuilding) -> Double
    {
        let from = MKMapItem.forCurrentLocation().placemark.coordinate
        
        let delta_longitude = abs(to.building.longitude - from.longitude)
        
        let x = cos(to.building.latitude) * sin(delta_longitude)
        let y = (cos(from.latitude) * sin(to.building.latitude)) - (sin(from.latitude) * cos(to.building.latitude) * cos(delta_longitude))
        
        let angle = atan2(x, y)
        
        return angle
    }
}

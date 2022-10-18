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
    
    func directions(to building: FavoritedBuilding)
    {
        let request = MKDirections.Request()
        request.source = MKMapItem.forCurrentLocation()
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: building.building.cLLocCoord2D))
        request.transportType = .walking
        request.requestsAlternateRoutes = false
                
        let directions = MKDirections(request: request)
        
        directions.calculate
        {
            response, error in
            
            guard error == nil else
            {
                self.route = nil
                return
            }
            
            if let route = response?.routes.first
            {
                let formatter = DateComponentsFormatter()
                
                self.expectedTime = formatter.string(from: route.expectedTravelTime) ?? "Time not found"
                
                self.route = route
            }
        }
    }
    
    var routeSteps : [String]
    {
        if let route = self.route
        {
            return route.steps.map {$0.instructions}
        }
        else
        {
            return []
        }
    }
}

extension Double
{
    var degrees: Double
    {
        Angle(radians: self).degrees
    }
    
    var radians: Double
    {
        Angle(degrees: self).radians
    }
}

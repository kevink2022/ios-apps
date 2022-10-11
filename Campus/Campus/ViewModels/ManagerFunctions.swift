//
//  ManagerFunctions.swift
//  Campus
//
//  Created by Kevin Kelly on 10/10/22.
//

import Foundation
import MapKit

extension MapManager
{
    func centerRegion()
    {
        guard !self.pinnedBuildings.isEmpty else { return }
        
        let max_lat  = self.pinnedBuildings.max
        {
            $0.building.latitude  > $1.building.latitude
        }!.building.latitude
        
        let min_lat  = self.pinnedBuildings.min
        {
            $0.building.latitude  > $1.building.latitude
        }!.building.latitude
        
        let max_long = self.pinnedBuildings.max
        {
            $0.building.longitude > $1.building.longitude
        }!.building.longitude
        
        let min_long = self.pinnedBuildings.min
        {
            $0.building.longitude > $1.building.longitude
        }!.building.longitude
        
        let lat_delta  = abs(max_lat  - min_lat )
        let long_delta = abs(max_long - min_long)
        
        region = MKCoordinateRegion(
            
            center: CLLocationCoordinate2D(
                latitude:  max_lat  + (lat_delta  / 2),
                longitude: max_long + (long_delta / 2)
            ),
            
            span: MKCoordinateSpan(
                latitudeDelta:  lat_delta  + MapConstants.spanBuffer,
                longitudeDelta: long_delta + MapConstants.spanBuffer
            )
        )
    }
    
    func buidlingNearby(building: FavoritedBuilding) -> Bool
    {
        if let loc = currentLocation?.coordinate
        {
            let build = building.building

            
            let lat_delta  = abs(build.latitude  - loc.latitude)
            let long_delta = abs(build.longitude - loc.longitude)
            
            if sqrt(abs(lat_delta + long_delta)) < MapConstants.nearby
            {
                return true
            }
        }
        return false
    }
}

//
//  BuildingAnnotation.swift
//  Campus
//
//  Created by Kevin Kelly on 9/30/22.
//

import Foundation
import MapKit

class BuildingAnnotation : NSObject, Identifiable, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
        
    let id = UUID()
    
    init(building: Building)
    {
        self.coordinate = building.cLLocCoord2D
    }
}

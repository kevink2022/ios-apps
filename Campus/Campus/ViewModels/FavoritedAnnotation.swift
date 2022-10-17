//
//  FavoritedAnnotation.swift
//  Campus
//
//  Created by Kevin Kelly on 10/14/22.
//

import Foundation
import MapKit

class FavoritedAnnotation : NSObject, Identifiable, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
    var building : FavoritedBuilding
    var route : MKRoute?
    var title: String?
    
    init(building: FavoritedBuilding)
    {
        self.coordinate = building.building.cLLocCoord2D
        self.building = building
        self.title = building.building.name
    }
}

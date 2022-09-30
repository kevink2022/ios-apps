//
//  Building+MapKit.swift
//  Campus
//
//  Created by Kevin Kelly on 9/30/22.
//

import Foundation
import MapKit

extension Building
{
    var cLLocCoord2D : CLLocationCoordinate2D
    {
        return CLLocationCoordinate2D(
            latitude: CLLocationDegrees(self.latitude),
            longitude: CLLocationDegrees(self.longitude)
        )
    }
}

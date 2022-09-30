//
//  MapManager.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import Foundation
import MapKit

class MapManager : ObservableObject
{
    private let storageManager : StorageManager<[Building]>
    private let span = MapConstants.span
    
    @Published var model : CampusModel
    var region : MKCoordinateRegion
    
    init()
    {
        storageManager = StorageManager(fileName: "buildings")
        
        let buildings = storageManager.modelData ?? []
                        
        let _model = CampusModel(buildings: buildings)
        
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(_model.centerCoord),
            span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        )
        
        model = _model
    }
}

struct MapConstants
{
    static let span = 0.03
}


extension CLLocationCoordinate2D
{
    init(_ coord: Coordinates)
    {
        self = CLLocationCoordinate2D(latitude: coord.latitude, longitude: coord.longitude)
    }
}

//
//  UICampusMap.swift
//  Campus
//
//  Created by Kevin Kelly on 10/14/22.
//

import SwiftUI
import MapKit

struct UICampusMap: UIViewRepresentable
{
    @EnvironmentObject var manager : MapManager
    let map = MKMapView()
    
    func makeUIView(context: Context) -> MKMapView
    {
        map.mapType = .standard
        map.showsUserLocation = true
        map.userTrackingMode = .follow
        map.region = manager.region
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ map: MKMapView, context: Context)
    {
        switch manager.mapConfig
        {
        case .standard: map.mapType = .standard
        case .hybrid:   map.mapType = .hybrid
        case .imagery:  map.mapType = .satellite
        }
        map.userTrackingMode = manager.trackingLocation ? .follow : .none
        
        let annotations = map.annotations
        map.removeAnnotations(manager.annotations)
        map.addAnnotations(manager.annotations)
    }
    
    func makeCoordinator() -> MapCoordinator
    {
        MapCoordinator(map: map, manager: manager)
    }
}

struct UICampusMap_Previews: PreviewProvider {
    static var previews: some View {
        UICampusMap()
    }
}

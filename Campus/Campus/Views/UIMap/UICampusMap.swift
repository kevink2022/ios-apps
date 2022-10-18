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
        
        let longPress = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.addPin(recognizer:)))
        map.addGestureRecognizer(longPress)
        
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
        
        map.removeAnnotations(map.annotations)
        map.addAnnotations(manager.annotations)
        
        map.removeOverlays(map.overlays)
        if let route = manager.route?.polyline
        {
            map.addOverlay(route)
        }
        
        if manager.moveRegion
        {
            map.region = manager.region
            manager.moveRegion = false
        }
        
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

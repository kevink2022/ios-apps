//
//  MapCoordinator.swift
//  Campus
//
//  Created by Kevin Kelly on 10/14/22.
//

import SwiftUI
import MapKit

class MapCoordinator : NSObject, MKMapViewDelegate
{
    let map : MKMapView
    var manager : MapManager
    
    init(map: MKMapView, manager: MapManager)
    {
        self.map = map
        self.manager = manager
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        switch annotation
        {
        case is MKUserLocation:
            return nil
            
        case is FavoritedAnnotation:
            let marker = MKAnnotationView(annotation: annotation, reuseIdentifier: "")
            let building = annotation as! FavoritedAnnotation
            
            marker.canShowCallout = true
            marker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            let image = UIImage(systemName: building.building.isFavorited ? ViewConstants.favorite : ViewConstants.building)
            marker.image = image
            
            return marker
            
        default:
            return nil
        }
    }
    
    func mapView(_ map: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        
        
        // assume view's annotation is a Place
        let building = view.annotation as! FavoritedAnnotation
        manager.selectedBuilding = building.building
        manager.sheet = .detailView
        manager.showSheet = true
    }
}

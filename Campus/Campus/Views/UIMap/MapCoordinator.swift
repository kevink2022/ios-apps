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
            
            if building.building.building.name != "Dropped Pin"
            {
                marker.image = UIImage(systemName: building.building.isFavorited ? ViewConstants.not_favorite : ViewConstants.not_building)
            }
            else
            {
                marker.image = UIImage(systemName: "mappin.and.ellipse")
            }
            
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
    
    func mapView(_ map: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        switch overlay
        {
        case is MKPolyline:
            let polyline = overlay as! MKPolyline
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = MapConstants.polylineColor
            renderer.lineWidth = MapConstants.polylineWidth
            return renderer
            
        case is MKCircle:
            let circle = overlay as! MKCircle
            let renderer = MKCircleRenderer(overlay: circle)
            return renderer
            
        case is MKPolygon:
            let polygon = overlay as! MKPolygon
            let renderer = MKPolygonRenderer(polygon: polygon)
            return renderer
            
        default:
            assert(false, "Unhandled Overlay")
        }
    }
    
    @objc func addPin(recognizer:UILongPressGestureRecognizer) {
        guard recognizer.state == .began else {return}
        let view = recognizer.view as! MKMapView
        let point = recognizer.location(in: view)
        let coordinate = view.convert(point, toCoordinateFrom: view)
        
        let fake_id = Int(((Double(coordinate.latitude) + Double(coordinate.longitude)) * 10000000)) % 555555
                
        let pin = FavoritedAnnotation(
            building: FavoritedBuilding(
                building: Building(
                    latitude: coordinate.latitude,
                    longitude: coordinate.longitude,
                    name: "Dropped Pin",
                    opp_bldg_code: fake_id,
                    photo: nil,
                    year_constructed: nil
                ),
                isFavorited: false,
                isPinned: false
            )
        )
        
        manager.droppedPins.append(pin.building)
    }
}

extension MapConstants
{
    static let polylineColor = UIColor.blue
    static let polylineWidth : CGFloat = 4
}

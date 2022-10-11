//
//  CampusMap.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import SwiftUI
import MapKit

struct CampusMap: View
{
    @EnvironmentObject var manager : MapManager
    
    private func annotationFor(building: FavoritedBuilding) -> some MapAnnotationProtocol
    {
        MapAnnotation(coordinate: building.building.cLLocCoord2D)
        {
            Button
            {
                manager.selectedBuilding = building
                manager.showSheet  = true
                manager.sheet      = .detailView
            }
            label:
            {
                Image(systemName: building.isFavorited ? ViewConstants.favorite : ViewConstants.building)
                    .foregroundColor(building.isFavorited ? ViewConstants.favorite_color : ViewConstants.pinned_color)
            }
        }
    }
    
    var body: some View
    {
        let drag = DragGesture()
            .onChanged{ value in manager.trackingLocation = false }
            .onEnded{ value in manager.trackingLocation = false }
        
        Map(coordinateRegion: $manager.region,
            showsUserLocation: true,
            userTrackingMode: manager.trackingLocation ? .constant(.follow) : .constant(.none),
            annotationItems: manager.presentedBuildings,
            annotationContent: annotationFor(building: )
        )
        .gesture(drag)
    }
}

struct CampusMap_Previews: PreviewProvider
{
    static var previews: some View
    {
        CampusMap()
            .environmentObject(MapManager())
    }
}

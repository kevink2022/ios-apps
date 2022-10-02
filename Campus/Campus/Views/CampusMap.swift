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
                manager.showDetailSheet  = true
            }
            label:
            {
                Image(systemName: "pin.fill")
                    .foregroundColor(building.isFavorited ? .yellow : .blue)
            }
        }
    }
    
    var body: some View
    {
        Map(coordinateRegion: $manager.region,
            annotationItems: manager.model.buildings,
            annotationContent: annotationFor(building: )
        )
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

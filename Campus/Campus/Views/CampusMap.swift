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
    
    var body: some View
    {
        Map(coordinateRegion: $manager.region)
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

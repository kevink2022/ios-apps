//
//  ContentView.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import SwiftUI

struct ContentView: View
{
    @EnvironmentObject var manager : MapManager
    
    var body: some View
    {
        NavigationStack
        {
            CampusMap()
                .ignoresSafeArea(edges: .horizontal)
                .ignoresSafeArea(edges: .bottom)
                
                .toolbar { ToolbarButtons() }
                
                .sheet(isPresented: $manager.showSheet)
                {
                    switch manager.sheet
                    {
                    case .detailView:   DetailView()
                    case .buildingMenu: BuildingMenu()
                    default:            BuildingMenu()
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
            .environmentObject(MapManager())
    }
}


struct ViewConstants
{
    // SF Images
    static let building         = "building.2.fill"
    static let not_building     = "building.2"
    static let favorite         = "star.fill"
    static let not_favorite     = "star"
    static let settings         = "gearshape"
    static let pinned           = "pin.fill"
    static let not_pinned       = "pin.slash"
    static let location         = "location.fill"
    static let not_location     = "location"
    static let directions       = "map.fill"
    static let not_directions   = "map"
    
    // Colors
    static let favorite_color   = Color.orange
    static let pinned_color     = Color.blue
    static let not_color        = Color.black
    static let location_color   = Color.green
    static let directions_color = Color.blue
}

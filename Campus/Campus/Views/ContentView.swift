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
        let drag = DragGesture()
            .onChanged{ value in manager.trackingLocation = false }
            .onEnded{ value in manager.trackingLocation = false }
        
        NavigationStack
        {
            ZStack
            {
                UICampusMap()
                //CampusMap()
                    .ignoresSafeArea(edges: .horizontal)
                    .ignoresSafeArea(edges: .bottom)
                    .gesture(drag)
                    
                    .toolbar { ToolbarButtons() }
                    
                    .sheet(isPresented: $manager.showSheet)
                    {
                        switch manager.sheet
                        {
                        case .detailView:   DetailView()
                        case .buildingMenu: BuildingMenu()
                        case .routeSteps:   RouteStepsView()
                        default:            BuildingMenu()
                        }
                    }
                
                if let _ = manager.route
                {
                    HStack{
                        Spacer()
                        VStack(alignment: .trailing){
                            RouteInfo()
                            Spacer()
                            RouteButton()
                        }
                    }
                    .padding()
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
    static let walking          = "figure.walk"
    
    // Colors
    static let favorite_color   = Color.orange
    static let pinned_color     = Color.blue
    static let not_color        = Color.black
    static let location_color   = Color.green
    static let directions_color = Color.blue
}

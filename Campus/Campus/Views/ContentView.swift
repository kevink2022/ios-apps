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
                .toolbar
                {
                    Image(systemName: "star")
                    Image(systemName: "building.2")
                    Image(systemName: "gearshape")
                    
                }
                .sheet(isPresented: $manager.showDetailSheet)
                {
                    manager.selectedBuilding = nil
                }
                content:
                {
                    DetailView(building: manager.selectedBuilding!)
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

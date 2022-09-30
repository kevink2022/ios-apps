//
//  ContentView.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        NavigationStack
        {
            CampusMap()
                .ignoresSafeArea(edges: .bottom)
                .toolbar
                {
                    Image(systemName: "star")
                    Image(systemName: "building.2")
                    Image(systemName: "gearshape")
                    
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

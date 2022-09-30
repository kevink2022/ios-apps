//
//  CampusApp.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import SwiftUI

@main
struct CampusApp: App
{
    @State var manager = MapManager()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(manager)
        }
    }
}

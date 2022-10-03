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
    @Environment(\.scenePhase) var scenePhase

    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(manager)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                manager.save()
            case .active:
                break
            case .inactive:
                break
            @unknown default:
                assert(false, "Unknown scene Phase")
            }
        }
    }
}

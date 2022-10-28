//
//  Poke_dexApp.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/19/22.
//

import SwiftUI

@main
struct Poke_dexApp: App
{
    @StateObject var manager = PokedexManager()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene
    {
        WindowGroup
        {
            MainView()
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

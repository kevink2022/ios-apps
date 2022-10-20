//
//  Poke_dexApp.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/19/22.
//

import SwiftUI

@main
struct Poke_dexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(manager: PokedexManager())
        }
    }
}

//
//  Lion_SpellApp.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

@main
struct Lion_SpellApp: App {
    @StateObject var game = ScrambleGameManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}

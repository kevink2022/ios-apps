//
//  PentominoesApp.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

@main
struct PentominoesApp: App
{
    @StateObject var game = PentominoManager()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(game)
        }
    }
}

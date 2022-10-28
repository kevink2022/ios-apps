//
//  ContentView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/19/22.
//

import SwiftUI

struct MainView: View
{
    typealias C = ViewConstants.MainView
    
    var body: some View
    {
        TabView
        {
            PokedexHome()
                .tabItem {Label(C.homeText, systemImage: C.homeImage)}
            
            PokedexList()
                .tabItem {Label(C.listText, systemImage: C.listImage)}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(PokedexManager())
    }
}

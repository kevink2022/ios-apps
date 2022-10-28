//
//  HomeView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/25/22.
//

import SwiftUI

struct HomeView: View
{
    @EnvironmentObject var manager : PokedexManager
    
    var body: some View
    {
        NavigationStack
        {
            // Title / toobar buttons
            
            // Various Row Views
            
            ForEach(PokemonType.allCases)
            {
                type in
                
                
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  ContentView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/19/22.
//

import SwiftUI

struct MainView: View
{
    @ObservedObject var manager : PokedexManager
    
    var body: some View
    {
        NavigationStack
        {
            List
            {
                ForEach(manager.pokemon)
                {
                    pokemon in

                    NavigationLink
                    {
                        PokemonDetailView(pokemon: pokemon)
                            .navigationTitle(pokemon.name)
                    }
                    label:
                    {
                        PokemonListView(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokédex")
            .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(manager: PokedexManager())
    }
}

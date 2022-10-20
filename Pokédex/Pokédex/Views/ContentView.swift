//
//  ContentView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/19/22.
//

import SwiftUI

struct ContentView: View
{
    @ObservedObject var manager : PokedexManager
    
    var body: some View
    {
        //PokemonImage(pokemon: .standard)
        
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
                    }
                    label:
                    {
                        PokemonListView(pokemon: pokemon)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: PokedexManager())
    }
}

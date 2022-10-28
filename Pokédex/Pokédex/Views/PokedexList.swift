//
//  PokedexList.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/28/22.
//

import SwiftUI

struct PokedexList: View
{
    @EnvironmentObject var manager : PokedexManager
    
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

struct PokedexList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexList()
    }
}

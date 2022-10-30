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
                ForEach($manager.catchable)
                {
                    $catchable in

                    NavigationLink
                    {
                        PokemonDetailView(catchable: catchable)
                            .toolbar {
                                DetailToolbar(catchable: $catchable)
                            }
                    }
                    label:
                    {
                        PokemonListView(catchable: catchable)
                    }
                    
//                    NavigationLink(value: catchable)
//                    {
//                        PokemonListView(pokemon: catchable.pokemon)
//                    }
                }
            }
            .navigationTitle("Pokédex")
            .navigationBarTitleDisplayMode(.automatic)
//            .navigationDestination(for: CatchablePokemon.self)
//            {
//                catchable in
//
//                PokemonDetailView(catchable: catchable)
//                    .toolbar {
//                        DetailToolbar(catchable: catchable)
//                    }
//            }
        }
    }
}

struct PokedexList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexList()
    }
}

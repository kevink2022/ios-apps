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
                ForEach(manager.listCatchable)
                {
                    catchable in

                    NavigationLink
                    {
                        PokemonDetailView(catchable: catchable)
                            .toolbar {
                                DetailToolbar(catchable: $manager.catchable[catchable.id - 1], dismissOnRelease: false)
                            }
                    }
                    label:
                    {
                        PokemonListView(catchable: catchable)
                    }
                }
            }
            .navigationTitle("Pokédex")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar { ListFilterMenu() }
        }
    }
}

struct PokedexList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexList()
    }
}

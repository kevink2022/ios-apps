//
//  CategoryView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/30/22.
//

import SwiftUI

struct CategoryView: View
{
    @EnvironmentObject var manager : PokedexManager
    typealias C = ViewConstants.CategoryView
    let title : String
    let catchable : [CatchablePokemon]
    let dismissOnRelease : Bool
    

    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text(title)
                .font(C.titleFont)
                .padding(.horizontal)
            
            ScrollView(.horizontal)
            {
                HStack
                {
                    ForEach(catchable)
                    {
                        catchable in
                        
                        NavigationLink
                        {
                            PokemonDetailView(catchable: catchable)
                                .toolbar {
                                    DetailToolbar(catchable: $manager.catchable[catchable.id - 1], dismissOnRelease: dismissOnRelease)
                                }
                        }
                        label:
                        {
                            PokemonCard(catchable: catchable)
                        }
                        
                    }
                }
                .padding(.vertical, C.verticalPadding)
                .padding(.horizontal, C.horizontalPadding)

            }
        }
    }
}


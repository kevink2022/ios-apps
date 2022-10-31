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
    @Environment(\.dismiss) var dismiss

    
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
                                    DetailToolbar(catchable: $manager.catchable[catchable.id - 1])
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

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView()
//    }
//}



//
//  PokemonDetailView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct PokemonDetailView: View
{
    @EnvironmentObject var manager : PokedexManager
    typealias C = ViewConstants.PokemonDetailView
    var catchable : CatchablePokemon
    
    var body: some View
    {
        ScrollView
        {
            VStack(alignment: .leading)
            {
                // MARK: - Image
                PokemonImage(
                    catchable: catchable,
                    cornerRadius: C.Image.cornerRadius,
                    interiorPadding: C.Image.interiorPadding,
                    overlayNumber: true
                )
                
                // MARK: - Statistics
                HStack
                {
                    Spacer()
                    
                    StatisticView(
                        title: "Height",
                        label: "m",
                        value: catchable.pokemon.height,
                        precision: 2
                    )
                    
                    Spacer()
                    
                    StatisticView(
                        title: "Weight",
                        label: "kg",
                        value: catchable.pokemon.weight,
                        precision: 1
                    )
                    
                    Spacer()
                }
                
                // MARK: - Types
                Text("Types")
                    .font(C.sectionTitleFont)
                
                HStack
                {
                    ForEach(catchable.pokemon.types)
                    {
                        type in
                        
                        TypeView(type: type)
                    }
                }
                
                // MARK: - Weaknesses
                Text("Weaknesses")
                    .font(C.sectionTitleFont)
                
                ScrollView(.horizontal)
                {
                    HStack
                    {
                        ForEach(catchable.pokemon.weaknesses)
                        {
                            type in
                            
                            TypeView(type: type)
                        }
                    }
                }

                EvolutionsView(catchable: catchable)
            }
            .padding()
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(catchable: (CatchablePokemon.standard))
    }
}

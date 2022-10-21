//
//  PokemonDetailView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct PokemonDetailView: View
{
    typealias C = ViewConstants.PokemonDetailView
    let pokemon : Pokemon
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            PokemonImage(
                pokemon: pokemon,
                cornerRadius: C.Image.cornerRadius,
                interiorPadding: C.Image.interiorPadding,
                isOverlay: true
            )
            
            HStack
            {
                Spacer()
                
                StatisticView(
                    title: "Height",
                    label: "m",
                    value: pokemon.height,
                    precision: 2
                )
                
                Spacer()
                
                StatisticView(
                    title: "Weight",
                    label: "kg",
                    value: pokemon.weight,
                    precision: 1
                )
                
                Spacer()
            }
            
            Text("Types")
                .font(C.sectionTitleFont)
            
            
            HStack
            {
                ForEach(pokemon.types)
                {
                    type in
                    
                    TypeView(type: type)
                }
            }

            
            Text("Weaknesses")
                .font(C.sectionTitleFont)
            
            ScrollView(.horizontal)
            {
                HStack
                {
                    ForEach(pokemon.weaknesses)
                    {
                        type in
                        
                        TypeView(type: type)
                    }
                }
            }
        }
        .padding()
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.standard)
    }
}

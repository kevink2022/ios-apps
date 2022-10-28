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
                    pokemon: catchable.pokemon,
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
                
                HStack
                {
                    if let prevEvo = catchable.pokemon.previousEvolutions
                    {
                        ForEach(prevEvo, id: \.self)
                        {
                            id in
                            
                            var catchable = manager.catchableFromId(id: id)
                            
                            NavigationLink
                            {
                                PokemonDetailView(catchable: catchable)
                            }
                            label:
                            {
                                PokemonImage(
                                    pokemon: catchable.pokemon,
                                    cornerRadius: 15,
                                    interiorPadding: 5,
                                    overlayNumber: false
                                )
                            }
                        }
                    }
                    
                    
                    if let nextEvo = catchable.pokemon.nextEvolutions
                    {
                        ForEach(nextEvo, id: \.self)
                        {
                            id in
                            
                            var catchable = manager.catchableFromId(id: id)
                            
                            NavigationLink
                            {
                                PokemonDetailView(catchable: catchable)
                            }
                            label:
                            {
                                PokemonImage(
                                    pokemon: catchable.pokemon,
                                    cornerRadius: 15,
                                    interiorPadding: 5,
                                    overlayNumber: true
                                )
                            }
                        }
                    }
                    
                }
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

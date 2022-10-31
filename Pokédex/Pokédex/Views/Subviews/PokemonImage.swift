//
//  PokemonImage.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct PokemonImage: View
{
    typealias C = ViewConstants.PokemonImage
    let catchable : CatchablePokemon
    let cornerRadius : CGFloat
    let interiorPadding : CGFloat
    let overlayNumber : Bool
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(
                    LinearGradient(
                        colors: catchable.pokemon.types.map {Color(pokemonType: $0)},
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .aspectRatio(1, contentMode: .fit)
                .opacity(C.backgroundOpacity)
                .overlay { if overlayNumber {
                        VStack { Spacer()
                            HStack { Spacer()
                                Text("\(catchable.pokemon.code)")
                                    .font(C.numberFont)
                            }
                        }
                        .padding()
                    }
                }
            

            if catchable.isCaught
            {
                CaughtView(caught: true)
                    .opacity(C.pokeballOpacity)
                    .padding(C.pokeballPadding)
            }
            
            Image(catchable.pokemon.code)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .padding(interiorPadding)
        }
    }
}

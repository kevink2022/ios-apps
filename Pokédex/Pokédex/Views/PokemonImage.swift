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
    let pokemon : Pokemon
    let cornerRadius : CGFloat
    let interiorPadding : CGFloat
    let isOverlay : Bool
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(
                    LinearGradient(
                        colors: pokemon.types.map {Color(pokemonType: $0)},
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .aspectRatio(1, contentMode: .fit)
                .opacity(C.backgroundOpacity)
                .overlay { if isOverlay {
                        VStack { Spacer()
                            HStack { Spacer()
                                Text("\(pokemon.code)")
                                    .font(C.numberFont)
                            }
                        }
                        .padding()
                    }
                }

            
            Image(pokemon.code)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .padding(interiorPadding)
            
            
        }
    }
}

//struct PokemonImage_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonImage(pokemon: Pokemon.standard)
//    }
//}

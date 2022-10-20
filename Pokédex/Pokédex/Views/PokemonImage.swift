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
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: C.cornerRadius)
                .fill(
                    LinearGradient(
                        colors: pokemon.types.map {Color(pokemonType: $0)},
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .aspectRatio(1, contentMode: .fit)

            
            Image(pokemon.code)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .padding(C.interiorPadding)
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage(pokemon: Pokemon.standard)
    }
}

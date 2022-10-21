//
//  PokemonListView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct PokemonListView: View
{
    typealias C = ViewConstants.PokemonListView
    let pokemon : Pokemon
    
    var body: some View
    {
        HStack
        {
            Text("\(pokemon.id)")
                .font(C.numberFont)
                .foregroundColor(C.textColor)

            
            Text("\(pokemon.name)")
                .font(C.nameFont)
                .foregroundColor(C.textColor)
            
            Spacer()
            
            PokemonImage(
                pokemon: pokemon,
                cornerRadius: C.Image.cornerRadius,
                interiorPadding: C.Image.interiorPadding,
                isOverlay: false
            )
            .frame(height: C.listHeight)
        }
        .padding()
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(pokemon: Pokemon.standard)
    }
}

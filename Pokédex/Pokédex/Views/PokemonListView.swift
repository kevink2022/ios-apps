//
//  PokemonListView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct PokemonListView: View
{
    typealias C = ViewConstants.PokemonList
    let pokemon : Pokemon
    
    var body: some View
    {
        HStack
        {
            Text("\(pokemon.code)")
                .font(.subheadline)
            
            Text("\(pokemon.name)")
                .bold()
            
            Spacer()
            
            PokemonImage(pokemon: pokemon)
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

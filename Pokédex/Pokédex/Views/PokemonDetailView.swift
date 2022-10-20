//
//  PokemonDetailView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct PokemonDetailView: View
{
    let pokemon : Pokemon
    
    var body: some View
    {
        VStack
        {
            PokemonImage(pokemon: pokemon)
            
            HStack
            {
                
            }
            
            Text("Types")
            
            
            HStack
            {
                ForEach(pokemon.types)
                {
                    type in
                    
                    TypeView(type: type)
                }
            }

            
            Text("Weaknesses")
            
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

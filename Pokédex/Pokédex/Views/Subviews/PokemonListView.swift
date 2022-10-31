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
    let catchable : CatchablePokemon
    
    var body: some View
    {
        HStack
        {
            Text("\(catchable.pokemon.id)")
                .font(C.numberFont)
                .foregroundColor(C.textColor)

            
            Text("\(catchable.pokemon.name)")
                .font(C.nameFont)
                .foregroundColor(C.textColor)
            
            Spacer()
            
            PokemonImage(
                catchable: catchable,
                cornerRadius: C.Image.cornerRadius,
                interiorPadding: C.Image.interiorPadding,
                overlayNumber: false
            )
            .frame(height: C.listHeight)
        }
        .padding()
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(catchable: CatchablePokemon.standard)
    }
}

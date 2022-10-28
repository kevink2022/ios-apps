//
//  DetailToolbar.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/28/22.
//

import SwiftUI

struct DetailToolbar: View
{
    typealias C = ViewConstants.DetailToobar
    @Binding var catchable : CatchablePokemon
    
    var body: some View
    {
        HStack
        {
            Text(catchable.pokemon.name)
                .font(C.titleFont)
            
            Spacer()
            
            CaughtButton(caught: $catchable.isCaught)
        }
    }
}

//struct PokemonDetailToolbar_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailToolbar()
//    }
//}

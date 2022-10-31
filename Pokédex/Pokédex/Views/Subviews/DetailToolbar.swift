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
    let dismissOnRelease : Bool
    
    var body: some View
    {
        HStack
        {
            Text(catchable.pokemon.name)
                .font(C.titleFont)
            
            Spacer()
            
            CaughtButton(caught: $catchable.isCaught, dismissOnRelease: dismissOnRelease)
        }
    }
}

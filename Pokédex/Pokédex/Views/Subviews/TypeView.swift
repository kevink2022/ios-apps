//
//  TypeView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct TypeView: View
{
    typealias C = ViewConstants.TypeView
    let type : PokemonType
    
    var body: some View
    {
        Text("\(type.id)")
            .padding(C.textPadding)
            .font(C.textFont)
            .foregroundColor(C.textColor)
            .background(
                RoundedRectangle(cornerRadius: C.cornerRadius)
                    .fill(Color(pokemonType: type))
            )
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView(type: PokemonType.fire)
    }
}

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
        RoundedRectangle(cornerRadius: C.cornerRadius)
            .foregroundColor(Color(pokemonType: type))
            .overlay { Text("\(type.id)") }
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView(type: PokemonType.fire)
    }
}

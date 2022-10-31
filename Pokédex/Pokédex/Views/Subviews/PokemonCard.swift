//
//  PokemonCard.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/30/22.
//

import SwiftUI

struct PokemonCard: View
{
    typealias C = ViewConstants.PokemonCard
    let catchable : CatchablePokemon
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: C.cornerRadius)
                .stroke(style: StrokeStyle(lineWidth: 3))
                .foregroundColor(.yellow)
            
            VStack(alignment: .leading)
            {
                PokemonImage(
                    catchable: catchable,
                    cornerRadius: C.Image.cornerRadius,
                    interiorPadding: C.Image.interiorPadding,
                    overlayNumber: false
                )
                
                Text("\(catchable.pokemon.id)")
                    .font(C.numberFont)
                    .foregroundColor(C.textColor)
                
                Text(catchable.pokemon.name)
                    .font(C.nameFont)
                    .foregroundColor(C.textColor)
            }
            .padding(C.interiorPadding)
        }
        .frame(width: C.cardWidth)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(catchable: CatchablePokemon.standard)
    }
}

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

extension ViewConstants
{
    struct PokemonCard
    {
        static let cornerRadius : CGFloat = 15
        static let interiorPadding : CGFloat = 5
        static let cardWidth : CGFloat = 150
        static let numberFont : Font = .system(.subheadline, design: .monospaced, weight: .regular)
        static let nameFont : Font = .system(.title3, design: .rounded, weight: .bold)
        static let textColor : Color = .primary
        
        struct Image
        {
            static let cornerRadius : CGFloat = 10
            static let interiorPadding : CGFloat = 5
        }

    }
}

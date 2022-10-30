//
//  EvolutionsView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/30/22.
//

import SwiftUI

struct EvolutionsView: View
{
    @EnvironmentObject var manager : PokedexManager
    typealias C = ViewConstants.EvolutionsView
    let catchable : CatchablePokemon
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            if let prevEvo = catchable.pokemon.previousEvolutions
            {
                Text("Previous Evolutions")
                    .font(C.titleFont)
                
                HStack
                {
                    ForEach(prevEvo, id: \.self)
                    {
                        id in
                        
                        let catchable = manager.catchableFromId(id: id)
                        
                        NavigationLink
                        {
                            PokemonDetailView(catchable: catchable)
                                .toolbar {
                                    DetailToolbar(catchable: $manager.catchable[catchable.id - 1])
                                }
                        }
                        label:
                        {
                            PokemonCard(catchable: catchable)
                        }
                    }
                }
            }
            
            
            if let nextEvo = catchable.pokemon.nextEvolutions
            {
                Text("Next Evolutions")
                    .font(C.titleFont)
                
                HStack
                {
                    ForEach(nextEvo, id: \.self)
                    {
                        id in
                        
                        let catchable = manager.catchableFromId(id: id)
                        
                        NavigationLink
                        {
                            PokemonDetailView(catchable: catchable)
                                .toolbar {
                                    DetailToolbar(catchable: $manager.catchable[catchable.id - 1])
                                }
                        }
                        label:
                        {
                            PokemonCard(catchable: catchable)
                        }
                    }
                }
            }
        }
    }
}

struct EvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionsView(catchable: CatchablePokemon.standard)
    }
}

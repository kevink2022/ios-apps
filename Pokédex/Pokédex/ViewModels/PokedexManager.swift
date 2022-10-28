//
//  PokedexManager.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import Foundation

class PokedexManager : ObservableObject
{
    @Published var catchable : [CatchablePokemon]
    @Published var path : [CatchablePokemon] = []
    let storageManager : StorageManager<[CatchablePokemon]>
    
    init()
    {
        storageManager = StorageManager<[CatchablePokemon]>(fileName: "catchable_pokedex")
        
        if let pokemon = storageManager.modelData
        {
            catchable = pokemon
        }
        else
        {
            let _pokemonStorage = StorageManager<[Pokemon]>(fileName: "pokedex")
            let _pokemon = _pokemonStorage.modelData ?? []
            
            catchable = _pokemon.map { CatchablePokemon(pokemon: $0) }
        }
    }
    
    func save() { storageManager.save(modelData: catchable) }
    
    func catchableFromId(id: Int) -> CatchablePokemon
    {
        if let index = catchable.firstIndex(where: {$0.id == id} )
        {
            return catchable[index]
        }
        else
        {
            return CatchablePokemon.standard
        }
    }
    
//    /// Simply a way to force a view redraw when changes dont propagate
//    @Published var redraw : Bool = true
//    func forceRedraw() { redraw.toggle() }
//
//    // MARK: - Intents
//
//    func toggleCaught(id: Int)
//    {
//        if let index = catchable.firstIndex(where: {$0.id == id} )
//        {
//            catchable[index].isCaught.toggle()
//            forceRedraw()
//        }
//    }
}

//
//  PokedexManager.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import Foundation

class PokedexManager : ObservableObject
{
    var catchable : [CatchablePokemon]
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
}

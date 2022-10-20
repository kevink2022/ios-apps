//
//  PokedexManager.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import Foundation

class PokedexManager : ObservableObject
{
    let pokemon : [Pokemon]
    let storageManager : StorageManager<[Pokemon]>
    
    init() {
        
        storageManager = StorageManager<[Pokemon]>(name: "pokedex")
        
        pokemon = storageManager.modelData ?? []
    }
}

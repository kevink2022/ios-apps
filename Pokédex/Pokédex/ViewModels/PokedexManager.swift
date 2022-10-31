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
    @Published var filterType : PokemonType? = nil
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
    
    // MARK: - Filtering
    
    enum Filters
    {
        case all, caught
        case type(PokemonType)
    }
    
    var listCatchable : [CatchablePokemon]
    {
        if let type = self.filterType
        {
            return self.filteredByType(type)
        }
        else
        {
            return self.catchable
        }
    }
    
    func filteredByCaught() -> [CatchablePokemon]
    {
        catchable.filter { $0.isCaught }
    }
    
    func filteredByType(_ filterType: PokemonType) -> [CatchablePokemon]
    {
        catchable.filter
        {
            $0.pokemon.types.reduce(false)
            {
                partial, type in ((type == filterType) || partial)
            }
        }
    }
}

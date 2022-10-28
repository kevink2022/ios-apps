//
//  Pokemon.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import Foundation

struct CatchablePokemon : Identifiable, Codable
{
    let pokemon : Pokemon
    var isCaught : Bool = false
    var id : Int {self.pokemon.id}
}

struct Pokemon : Identifiable, Encodable
{
    let id : Int
    let name : String
    let types : [PokemonType]
    let height : Double
    let weight : Double
    let weaknesses : [PokemonType]
    let previousEvolutions : [Int]?
    let nextEvolutions : [Int]?
    
    var code : String
    {
        String(Array(String(1000 + id))[1...])
    }

    enum CodingKeys : String, CodingKey
    {
        case previousEvolutions = "prev_evolution"
        case nextEvolutions = "next_evolution"
        case id, name, types, height, weight, weaknesses
    }
    
    static let standard = Pokemon(
        id: 46,
        name: "Paras",
        types: [
            PokemonType(rawValue: "Bug")!,
            PokemonType(rawValue: "Grass")!
          ],
        height: 0.30,
        weight: 5.4,
        weaknesses: [
            PokemonType(rawValue: "Fire")!,
            PokemonType(rawValue: "Ice")!,
            PokemonType(rawValue: "Poison")!,
            PokemonType(rawValue: "Flying")!,
            PokemonType(rawValue: "Bug")!,
            PokemonType(rawValue: "Rock")!,
          ],
        previousEvolutions: nil,
        nextEvolutions: [
            47
          ]
    )
}

extension Pokemon : Decodable
{
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        types = try values.decode([PokemonType].self, forKey: .types)
        height = try values.decode(Double.self, forKey: .height)
        weight = try values.decode(Double.self, forKey: .weight)
        weaknesses = try values.decode([PokemonType].self, forKey: .weaknesses)
        previousEvolutions = try values.decodeIfPresent([Int].self, forKey: .previousEvolutions)
        nextEvolutions = try values.decodeIfPresent([Int].self, forKey: .nextEvolutions)
    }
}

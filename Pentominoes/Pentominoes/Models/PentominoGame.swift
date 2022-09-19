//
//  PentominoGame.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import Foundation

struct PentominoGame
{
    let boardNames : Array<String> = ["Board0", "Board1", "Board2", "Board3", "Board4", "Board5"]
    let solutions : Int = 0 // Not needed for assign 1
    
    // Not piece as pieces need to be mutable
    // This is subject to change however
    let tiles : Array<Tile>
    
    init(tiles t: [Tile])
    {
        tiles = t
    }
    
    
}

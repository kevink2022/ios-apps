//
//  PentominoGame.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import Foundation

struct PentominoGame
{
    let boardNames : Array<String> = PentominoConstants.Boards
    let solutions : Array<Solution>
    var pieces : Array<Piece>
    
    init(tiles t: [Tile], solutions s: [Solution])
    {
        solutions = s
        
        var _pieces : Array<Piece> = []
        
        for tile in t
        {
            _pieces.append(Piece(tile: tile, position: Position()))
        }
        
        pieces = _pieces
    }
    
    mutating func setPieces(pieces p: Array<Piece>)
    {
        self.pieces = p
    }
    
    mutating func solve(boardNum : Int)
    {
        guard (boardNum != 0) else
        {
            return
        }
        
        let solution = solutions[boardNum - 1]
        
        for index in pieces.indices
        {
            let pos = solution[pieces[index].tile.name]!
            
            pieces[index].position = pos
        }
        
    }
}



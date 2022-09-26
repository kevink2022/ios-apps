//
//  PieceModel.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/26/22.
//

import Foundation

// a Piece is the model data that the view uses to display a pentomino
struct Piece
{
    let tile : Tile
    var position : Position
    
    static let standard = Piece(tile: Tile.standard, position: Position())
}

extension Piece
{
    var x_literal : Int
    {
        let block = LayoutConstants.block_size
        
        return (self.position.x * block) + (self.tile.width * block) + (self.tile.width%2 * block/2)
    }
    
    var y_literal : Int
    {
        let block = LayoutConstants.block_size
        
        return (self.position.y * block) + (self.tile.height * block) + (self.tile.height%2 * block/2)
    }
    
}

extension Piece
{
    mutating func moveTo(x: Int, y: Int)
    {
        self.position.x = x
        self.position.y = y
    }
    
    mutating func rotate()
    {
        if self.position.rotations == 3
        {
            self.position.rotations = 0
        }
        else
        {
            self.position.rotations += 1
        }
    }
    
    mutating func flip()
    {
        self.position.isFlipped.toggle()
    }
    
    mutating func moveByLiteral(x_literal : Int, y_literal : Int)
    {
        
    }
}

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
        let width = self.position.rotations % 2 == 0 ? self.tile.width : self.tile.height

        
        return (self.position.x * block) + (width/2 * block) + (width%2 * block/2)
    }
    
    var y_literal : Int
    {
        let block  = LayoutConstants.block_size
        let height = self.position.rotations % 2 == 0 ? self.tile.height : self.tile.width
        
        return (self.position.y * block) + (height/2 * block) + (height%2 * block/2)
    }
    
    var angle : Double
    {
        Double(self.position.rotations * 90)
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
        
        // translate piece position to make
        let lobsidedness = ((self.tile.height - self.tile.width)/2) * (self.position.rotations % 2 == 1 ? 1 : -1)
        
        self.position.x -= lobsidedness
        self.position.y += lobsidedness

    }
    
    mutating func flip()
    {
        self.position.isFlipped.toggle()
    }
    
    mutating func moveByLiteral(x_literal : Int, y_literal : Int)
    {
        let block = LayoutConstants.block_size
        
        let x_threshold = (x_literal % block) / (block/2)
        let y_threshold = (y_literal % block) / (block/2)

        let x_translation = (x_literal / block) + x_threshold
        let y_translation = (y_literal / block) + y_threshold
        
        self.moveTo(
            x: self.position.x + x_translation,
            y: self.position.y + y_translation
        )

    }
}

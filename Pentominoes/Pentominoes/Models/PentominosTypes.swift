//
//  PentominoesTypes.swift
//  Assets for Assignment 4
//
//  Created by Hannan, John Joseph on 9/7/22.
//  Modified by Kevin Kelly
//

import Foundation

// a tile with width/height in unit coordinates
struct Tile : Codable
{
    let name : String
    let width : Int
    let height : Int
    
    static let standard = Tile(name: "I", width: 1, height: 4)
}

// specifies the complete orientation of a piece using unit coordinates
struct Position : Codable
{
    var x : Int
    var y : Int
    var isFlipped : Bool
    var rotations : Int
    
    init()
    {
        x = 0
        y = 0
        isFlipped = false
        rotations = 0
    }
}

// a Piece is the model data that the view uses to display a pentomino
struct Piece
{
    let tile : Tile
    var position : Position
    
    static let standard = Piece(tile: Tile.standard, position: Position())
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
}

typealias Solution = [String : Position]

struct PentominoConstants
{
    static let Boards = ["Board0", "Board1", "Board2", "Board3", "Board4", "Board5"]
    static let DefaultBoard = "Board1"
}

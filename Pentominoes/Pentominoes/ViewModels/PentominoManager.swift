//
//  PentominoManager.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import Foundation

class PentominoManager : ObservableObject
{
    let model : PentominoGame
    var pieces : Array<Piece>
    
    @Published var currentBoard : String
    
    private let tileManager : StorageManager<[Tile]>
    
    init()
    {
        tileManager = StorageManager(fileName: "Tiles")
        
        let tiles = tileManager.modelData ?? []
        
        model = PentominoGame(tiles: tiles)
        
        pieces = PentominoManager.initPositions(tiles: tiles)
                
        currentBoard = "Board1"
    }
 
    func chooseBoard(title board: String)
    {
        currentBoard = board
    }
    
    static private func initPositions(tiles t: Array<Tile>) -> Array<Piece>
    {
        var pieces : Array<Piece> = []
        var x = LayoutConstants.x_inital
        var y = LayoutConstants.y_inital
        
        for tile in t
        {
            pieces.append(Piece(tile: tile, position: Position()))
        }
        
        for index in pieces.indices
        {
            pieces[index].position.x = x
            pieces[index].position.y = y
            
            x += LayoutConstants.x_step
            
            if x == LayoutConstants.x_inital + (LayoutConstants.x_step * LayoutConstants.x_row_count)
            {
                x = LayoutConstants.x_inital
                y += LayoutConstants.y_step
            }
        }
        
        return pieces
    }
}

struct LayoutConstants
{
    static let y_inital = 700
    static let x_inital = 40
    static let x_step   = 160
    static let y_step   = 200
    static let x_row_count = 4
}

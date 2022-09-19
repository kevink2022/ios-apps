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
    
    private let tileManager : StorageManager<[Tile]>
    //private let solutionManager : StorageManager<[Solution]>
    
    init()
    {
        tileManager = StorageManager(fileName: "Tiles")
        
        let tiles = tileManager.modelData ?? []
        
        model = PentominoGame(tiles: tiles)
        
        pieces = PentominoManager.initPositions(tiles: tiles)
    }
 
    func chooseBoard(title board: String)
    {
        
    }
    
    static private func initPositions(tiles t: Array<Tile>) -> Array<Piece>
    {
        var pieces : Array<Piece> = []
        
        for tile in t
        {
            pieces.append(Piece(tile: tile, position: Position()))
        }
        
        return pieces
    }
    
}

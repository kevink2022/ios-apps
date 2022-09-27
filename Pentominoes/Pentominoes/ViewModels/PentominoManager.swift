//
//  PentominoManager.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import Foundation

class PentominoManager : ObservableObject
{
    @Published var model : PentominoGame
    
    @Published var currentBoard : String
    
    private let tileManager : StorageManager<[Tile]>
    private let solutionManager : StorageManager<[Solution]>
    
    var boardNumber : Int
    {
        currentBoard.last?.wholeNumberValue ?? 0
    }
    
    init()
    {
        tileManager = StorageManager(fileName: "Tiles")
        
        let tiles = tileManager.modelData ?? []
        
        solutionManager = StorageManager(fileName: "Solutions")
        
        let solutions = solutionManager.modelData ?? []
        
        model = PentominoGame(tiles: tiles, solutions: solutions)
                        
        currentBoard = PentominoConstants.DefaultBoard
        
        model.setPieces(pieces: PentominoManager.initPositions(pieces: model.pieces))
    }
 
    static private func initPositions(pieces: [Piece]) -> [Piece]
    {
        var _pieces : Array<Piece> = pieces
        var x = LayoutConstants.x_inital
        var y = LayoutConstants.y_inital
        
        for index in _pieces.indices
        {
            _pieces[index].moveTo(x: x, y: y)
            _pieces[index].position.isFlipped = false
            _pieces[index].position.rotations = 0
            
            x += LayoutConstants.x_step
            
            if x == LayoutConstants.x_inital + (LayoutConstants.x_step * LayoutConstants.x_row_count)
            {
                x = LayoutConstants.x_inital
                y += LayoutConstants.y_step
            }
        }
        
        return _pieces
    }
}

struct LayoutConstants
{
    static let y_inital = 15
    static let x_inital = 0
    static let x_step   = 4
    static let y_step   = 5
    static let x_row_count = 4
    static let block_size  = 40
}


// MARK: Intents
extension PentominoManager
{
    func chooseBoard(title board: String)
    {
        currentBoard = board
    }
    
    func reset()
    {
        model.setPieces(pieces: PentominoManager.initPositions(pieces: model.pieces))
    }
    
    func solve()
    {
        model.solve(boardNum: boardNumber)
    }
}

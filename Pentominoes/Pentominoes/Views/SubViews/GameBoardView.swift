//
//  GameBoardView.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct GameBoardView: View
{
    @EnvironmentObject var game : PentominoManager
    
    var body: some View
    {
        ZStack(alignment: .topLeading)
        {
            Image(game.currentBoard)
            
            ForEach(game.model.pieces, id: \.self.tile.name)
            {
                piece in PieceView(piece: piece)
            }
        }
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}

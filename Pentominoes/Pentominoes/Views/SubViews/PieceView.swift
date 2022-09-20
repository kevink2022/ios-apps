//
//  PieceView.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct PieceView: View
{
    let piece : Piece
    
    var body: some View
    {
        Image(piece.tile.name)
            .position(
                x: CGFloat(piece.position.x),
                y: CGFloat(piece.position.y)
            )
    }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView(piece: Piece.standard)
    }
}

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
    @State var scale = 1.0
    @State var offset = CGSize.zero
    
    var body: some View
    {
        let move = DragGesture()
            .onChanged
            {
                value in
                offset = value.translation
            }
            .onEnded
            {
                value in
                offset = CGSize.zero
            }
        
        Image(piece.tile.name)
            .position(
                x: CGFloat(piece.position.x),
                y: CGFloat(piece.position.y)
            )
            .scaleEffect(scale)
            .offset(offset)
            .gesture(move)
    }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView(piece: Piece.standard)
    }
}

//
//  PieceView.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct PieceView: View
{
    @Binding var piece : Piece
    @State   var scale = 1.0
    @State   var offset = CGSize.zero
    
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
                
                piece.moveByLiteral(
                    x_literal: Int(value.translation.width),
                    y_literal: Int(value.translation.height)
                )
                
                offset = CGSize.zero
            }
        
        ZStack
        {
            Image(piece.tile.name)
            
            VStack
            {
                Text("(\(piece.position.x), \(piece.position.y))")
                
                Text("(\(piece.x_literal), \(piece.y_literal))")

            }
            .font(.title)
        
        }
        .position(
            x: CGFloat(piece.x_literal),
            y: CGFloat(piece.y_literal)
        )
        .scaleEffect(scale)
        .offset(offset)
        .gesture(move)
        
//        Image(piece.tile.name)
//            .position(
//                x: CGFloat(piece.x_literal),
//                y: CGFloat(piece.y_literal)
//            )
//            .scaleEffect(scale)
//            .offset(offset)
//            .gesture(move)
    }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView(piece: .constant(Piece.standard))
    }
}

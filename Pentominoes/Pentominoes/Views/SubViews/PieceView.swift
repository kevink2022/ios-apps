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
    
    // Animatable values
    @State   var scale   = 1.0
    @State   var offset  = CGSize.zero
    @State   var angle   = Angle.zero   // Violate SSOT??
    
    
    
    var body: some View
    {
        let move = DragGesture()
            .onChanged
            {
                value in
                offset = value.translation
                scale = 1.2
            }
            .onEnded
            {
                value in
                
                piece.moveByLiteral(
                    x_literal: Int(value.translation.width),
                    y_literal: Int(value.translation.height)
                )
                
                offset = CGSize.zero
                scale = 1.0
            }
        
        let rotate = TapGesture(count: 1)
            .onEnded
            {
                piece.rotate()
                angle = Angle(degrees: Double(piece.position.rotations * 90))
            }
        
        let flip = LongPressGesture(minimumDuration: 0.05, maximumDistance: 50)
            .onEnded
            {
                _ in
                piece.flip()
            }

        Image(piece.tile.name)
            .rotationEffect(angle)
            .rotation3DEffect(Angle(degrees: (piece.position.isFlipped ? 180 : 0)), axis: (x:0, y:1, z:0))
            .scaleEffect(scale)
            .position(
                x: CGFloat(piece.x_literal),
                y: CGFloat(piece.y_literal)
            )
            .offset(offset)
            .animation(.linear(duration: 0.05), value: scale)
            .animation(.easeInOut, value: angle)
            .animation(.easeInOut, value: piece.position.isFlipped)
            .gesture(move)
            .gesture(rotate)
            .gesture(flip)
        
    }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView(piece: .constant(Piece.standard))
    }
}


//ZStack
//{
//    Image(piece.tile.name)
//
//    VStack
//    {
//        Text("(\(piece.position.x), \(piece.position.y))")
//
//        Text("(\(piece.x_literal), \(piece.y_literal))")
//
//    }
//    .font(.title)
//
//}
//
//.rotationEffect(angle)
//.rotation3DEffect(Angle(degrees: (flipped ? 180 : 0)), axis: (x:0, y:1, z:0))
//.scaleEffect(scale)
//.position(
//    x: CGFloat(piece.x_literal),
//    y: CGFloat(piece.y_literal)
//)
//.offset(offset)
//.animation(.linear(duration: 0.05), value: scale)
//.animation(.easeInOut, value: angle)
//.animation(.easeInOut, value: flipped)
//.gesture(move)
//.gesture(rotate)
//.gesture(flip)

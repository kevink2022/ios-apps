//
//  LetterButtonWheel.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/10/22.
//

import SwiftUI

struct LetterButtonWheel: View {
    
    @EnvironmentObject var game : ScrambleGameManager
    
    
    var body: some View {
        
        Text("hello")
        
//        let angle = (2.0*Double.pi/Double(game.model.letterCount-1))
//
//        ZStack
//        {
//            LetterButton(letter: game.letterSet[0])
//                .rotationEffect(Angle(degrees: ViewConstants.baseRotationAngle))
            
//            ForEach(game.letterSet.indices)
//            { index in
//
//                let x = cos( Double() * angle)
//                let y = sin( Double() * angle)
//
//                LetterButton(letter: game.letterSet[index])
//                    .rotationEffect(Angle(degrees: ViewConstants.baseRotationAngle))
//                    .offset(
//                        x: CGFloat( * ViewConstants.baseOffset),
//                        y: CGFloat( * ViewConstants.baseOffset)
//                    )
//            }
        //}
    }
}

extension ViewConstants
{
    static let baseRotationAngle : Double = 270
    static let baseOffset : Double = 50
}

struct LetterButtonWheel_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonWheel()
    }
}

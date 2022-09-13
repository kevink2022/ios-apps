//
//  LetterButtonWheel.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/10/22.
//

import SwiftUI

struct LetterButtonWheel: View {
    
    @EnvironmentObject var game : ScrambleGameManager
    let buttonCount: Int
    let points: Array<ButtonPoint>

    var body: some View {
        
        ZStack
        {
                ForEach(points)
                {
                    point in
                    
                    LetterButton(letter: game.model.letterSet[point.index], index: point.index)

                        .rotationEffect(Angle(degrees: (point.index == 0 ? 180 : 0) + (buttonCount == 7 ? 90 : 0)))
                        
                        .scaleEffect(ViewConstants.buttonScale)
                        
                        .position(point.point)
                        
                        .offset(
                            
                            x: CGFloat(buttonCount == 5 && point.index != 0 ? (point.index < 3 ? +ViewConstants.fiveButtonOffset : -ViewConstants.fiveButtonOffset ) : 0),
                            
                            y: CGFloat(point.index == 0 ? ViewConstants.centerButtonOffset : (buttonCount == 5 ? (point.index == 1 || point.index == 4 ? -ViewConstants.fiveButtonOffset : +ViewConstants.fiveButtonOffset ) : 0) )
                        )
                }
                .rotationEffect(Angle(degrees: 90))
        }
    }
}

// These view constants are optimized for the iPhone 13 and 13 pro.
// For whatever reason, the center point is different depending on the device.
// For the 5 button shift, that is just bad code
extension ViewConstants
{
    static let fiveButtonOffset : Double = 90
    static let buttonScale : Double = 0.35
    static let centerButtonOffset : Double = -10
}

struct LetterButtonWheel_Previews: PreviewProvider {
    static var previews: some View {
        Text("balls")
        //LetterButtonWheel()
    }
}

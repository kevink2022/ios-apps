//
//  LetterButtonWheel.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/10/22.
//

import SwiftUI

struct LetterButtonWheel: View {
    
    @EnvironmentObject var game : ScrambleGameManager
    //let geo: GeometryProxy
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
                        .scaleEffect(buttonCount <= 5 ? 0.35 : 0.3)
                        .position(point.point)
                        .offset(
                            x: CGFloat(buttonCount == 5 && point.index != 0 ? (point.index < 3 ? +ViewConstants.fiveButtonOffset : -ViewConstants.fiveButtonOffset ) : 0),
                            y: CGFloat(point.index == 0 ? -10 : (buttonCount == 5 ? (point.index == 1 || point.index == 4 ? -ViewConstants.fiveButtonOffset : +ViewConstants.fiveButtonOffset ) : 0) )
                        )
                }
                .rotationEffect(Angle(degrees: 90))
                .offset(x: CGFloat(0), y: CGFloat(0))
            
        }
    }
}

extension ViewConstants
{
    static let baseRotationAngle : Double = 270
    static let baseOffset : Double = 50
    static let fiveButtonOffset : Double = 90
}

struct LetterButtonWheel_Previews: PreviewProvider {
    static var previews: some View {
        Text("balls")
        //LetterButtonWheel()
    }
}

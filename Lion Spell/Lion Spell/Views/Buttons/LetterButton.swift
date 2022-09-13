//
//  LetterButton.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct LetterButton: View
{
    @EnvironmentObject var game : ScrambleGameManager
    let letter: Letter
    let index: Int
    
    var body: some View
    {
        Button(action: {game.addLetter(letter.letter)})
        {
            ZStack
            {
                
                //Rectangle()
                RegularPolygon(sides: game.model.letterCount - 1)
                    .fill(index == 0 ? .yellow : .white)
                    //.foregroundColor(.white)
                    //.cornerRadius(ViewConstants.letterButtonCornerRadius)
                    .aspectRatio(1, contentMode: .fit)
                
                
                
                Text(String(letter.letter))
                    .font(.custom("American Typewriter Semibold", size: ViewConstants.largeTypewriterFontSize*3))
                    // This is real creative
                    .rotationEffect(Angle(degrees: -90 - (index == 0 ? 180 : 0) - (game.model.letterCount == 7 ? 90 : 0)))
                    .foregroundColor(Color("psuBlue"))
            }
        }
    }
}

extension ViewConstants
{
    static let letterButtonCornerRadius : CGFloat = 10
}

struct LetterButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            //LetterButton(letter: "a")
        }
    }
}

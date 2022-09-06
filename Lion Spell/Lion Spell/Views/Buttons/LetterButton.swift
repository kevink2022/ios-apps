//
//  LetterButton.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct LetterButton: View {
    @EnvironmentObject var game : ScrambleGameManager
    let letter: Letter
    
    var body: some View {

        ZStack
        {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(ViewConstants.letterButtonCornerRadius)
                .aspectRatio(1, contentMode: .fit)
            
            Button(action: {game.addLetter(letter.letter)})
            {
                Text(String(letter.letter))
                    .font(.custom("American Typewriter Semibold", size: ViewConstants.largeTypewriterFontSize))
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

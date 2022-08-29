//
//  LetterButton.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct LetterButton: View {
    let letter: Character
    
    var body: some View {
        
        ZStack
        {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .aspectRatio(1, contentMode: .fit)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
            {
                Text(String(letter))
                    .font(.custom("American Typewriter Semibold", size: 42))
                    .foregroundColor(Color("psuBlue"))
            }
        }
        
        
    }
}

struct LetterButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            LetterButton(letter: "a")
        }
    }
}

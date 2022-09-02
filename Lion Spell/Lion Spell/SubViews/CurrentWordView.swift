//
//  CurrentWordView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct CurrentWordView: View {
    let word : Word
    
    var body: some View
    {
        HStack
        {
            // Prevents view from taking less space when no word is present
            if word.count == 0
            {
                Text(" ")
                    .font(.custom("Chalkduster", size: 48))
                    .foregroundColor(.white)
            }
            else
            {
                ForEach(word.letters)
                {
                    letter in
                        Text("\(String(letter.letter))")
                            .font(.custom("Chalkduster", size: 48))
                            .foregroundColor(.white)
                }
            }
            
            
        }
    }}

struct CurrentWordView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            //CurrentWordView(letters: ["a", "b", "c", "d", "e"])
        }
        
    }
}

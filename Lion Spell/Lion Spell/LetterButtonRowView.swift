//
//  LetterButtonRowView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct LetterButtonRowView: View {
    let letters: Array<Character>
    
    var body: some View
    {
        HStack(spacing:20)
        {
            ForEach(letters.indices)
            {
                index in
                    LetterButton(letter: letters[index])
            }
            
        }
        .padding(.horizontal)
    }
}

struct LetterButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            LetterButtonRowView(letters: ["a", "b", "c", "d", "e"])
        }
    }
}

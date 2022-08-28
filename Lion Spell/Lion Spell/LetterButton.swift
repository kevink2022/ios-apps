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
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
        {
            Text(String(letter))
        }
    }
}

struct LetterButton_Previews: PreviewProvider {
    static var previews: some View {
        LetterButton(letter: "a")
    }
}

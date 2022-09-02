//
//  BackspaceButton.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/2/22.
//

import SwiftUI

struct BackspaceButton: View {
    @EnvironmentObject var game : ScrambleGameManager
    
    var buttonColor : Color
    {
        if game.backspaceButtonDisabled
        {
            return .gray
        }
        else
        {
            return .white
        }
    }
    
    var body: some View
    {
        Button(action: {game.backspace()})
        {
            Image(systemName: "delete.left.fill")
                .font(.largeTitle)
                .foregroundColor(buttonColor)
        }
        .disabled(game.backspaceButtonDisabled)
    }

}

struct BackspaceButton_Previews: PreviewProvider {
    static var previews: some View {
        BackspaceButton()
    }
}

//
//  SubmitButton.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/2/22.
//

import SwiftUI

struct SubmitButton: View {
    @EnvironmentObject var game : ScrambleGameManager
    
    var buttonColor : Color
    {
        if game.submitButtonDisabled
        {
            return .gray
        }
        else
        {
            return .green
        }
    }
    
    var body: some View
    {
        Button(action: {game.submit()})
        {
            Image(systemName: "paperplane.fill")
                .font(.largeTitle)
                .foregroundColor(buttonColor)
                
        }
        .disabled(game.submitButtonDisabled)
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton()
    }
}

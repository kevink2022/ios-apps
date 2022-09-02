//
//  NewGameButton.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/2/22.
//

import SwiftUI

struct NewGameButton: View {
    @EnvironmentObject var game : ScrambleGameManager
    
    var body: some View {
        Button(action: {game.newGame()})
        {
            Image(systemName: "plus.circle")
        }
    }
}

struct NewGameButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
        //NewGameButton()
    }
}

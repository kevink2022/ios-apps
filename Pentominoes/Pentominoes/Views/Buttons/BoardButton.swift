//
//  BoardButton.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct BoardButton: View
{
    @EnvironmentObject var game : PentominoManager
    let boardTitle : String
    
    var body: some View
    {
        Button
        {
            game.chooseBoard(title: boardTitle)
        }
        label:
        {
            Image(boardTitle + "button")
        }
    }
}

struct BoardButton_Previews: PreviewProvider {
    static var previews: some View {
        BoardButton(boardTitle: "Board5")
            .environmentObject(PentominoManager())
    }
}

//
//  ContentView.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct ContentView: View
{
    @EnvironmentObject var game : PentominoManager
    
    var body: some View
    {
        HStack
        {
            VStack
            {
                ButtonColumn(boardButtons: game.model.boardNames.dropLast(3))
                
                ResetButton()
            }
            
            GameBoardView()
            
            VStack
            {
                ButtonColumn(boardButtons: Array(game.model.boardNames.dropFirst(3)))
                
                SolveButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group {
            ContentView()
                .environmentObject(PentominoManager())
            ContentView()
                .environmentObject(PentominoManager())
        }
    }
}

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
        ZStack
        {
            Color(.orange)
                .ignoresSafeArea()
            
            HStack
            {
                Spacer()
                
                VStack
                {
                    ButtonColumn(boardButtons: game.model.boardNames.dropLast(3))
                    
                    ResetButton()
                    
                    Spacer()
                }
                .padding(.top, 40)
                
                GameBoardView()
                    .frame(width: 560)
                    .padding()
                
                VStack
                {
                    ButtonColumn(boardButtons: Array(game.model.boardNames.dropFirst(3)))
                    
                    SolveButton()
                    
                    Spacer()
                }
                .padding(.top, 40)
                
                Spacer()
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

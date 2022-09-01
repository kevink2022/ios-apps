//
//  ContentView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = ScrambleGameManager()
    
    
    var body: some View {
        
        ZStack
        {
            Color("psuBlue")
                .ignoresSafeArea()
            
            VStack {

                TitleView()
                
                Spacer()
                            
                FoundWordsView(words: game.foundWords)
                
                CurrentWordView(letters: game.currentWord)
                
                LetterButtonRowView(letters: ["a", "b", "c", "d", "e"])
                
                GameButtonView()

                Spacer()
                
                ScoreView(score: game.score)
                
                Spacer()
                
                MenuButtonView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

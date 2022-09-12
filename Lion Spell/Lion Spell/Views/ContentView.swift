//
//  ContentView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

enum Showing: String, Identifiable, CaseIterable
{
    case hints, preferences
    var id: RawValue { rawValue }
}


struct ContentView: View {
    @EnvironmentObject var game : ScrambleGameManager
    //@ObservedObject var game = ScrambleGameManager()
    
    var body: some View {
        
        ZStack
        {
            Color("psuBlue")
                .ignoresSafeArea()
            
            VStack {

                SimpleTitleView()
                                            
                FoundWordsView(words: game.foundWords)
                
                CurrentWordView(word: game.currentWord)
                
                Spacer()
                
                LetterButtonRowView(letters: game.letterSet)
                
                Spacer()
                
                GameButtonView()
                
                ScoreView(score: game.score)
                                
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

//
//  ContentView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

enum ShowingSheet: String, Identifiable, CaseIterable
{
    case hints, preferences
    var id: RawValue { rawValue }
}


struct ContentView: View {
    @EnvironmentObject var game : ScrambleGameManager
    //@ObservedObject var game = ScrambleGameManager()
    @State var sheet : ShowingSheet?
    
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
                
                LetterButtonRowView(letters: game.model.letterSet)
                
                Spacer()
                
                GameButtonView()
                
                ScoreView(score: game.score)
                                
                MenuButtonView(sheet: $sheet)
            }
            .padding()
            .sheet(item: $sheet)
            {
                item in
                
                switch item
                {
                case .hints         : HintsSheet()
                case .preferences   : PreferencesSheet()
                }
            }
            .onDisappear
            {
                sheet = nil
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

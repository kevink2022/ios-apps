//
//  ContentView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack
        {
            Color("psuBlue")
                .ignoresSafeArea()
            
            VStack {
                TitleView()
                
                Spacer()
                            
                FoundWordsView(words: ["Lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit","sed","do","eiusmod","tempor","incididunt","ut","labore","et","dolore","magna","aliqua"])
                
                CurrentWordView(letters: ["a", "b", "c", "d", "e"])
                
                LetterButtonRowView(letters: ["a", "b", "c", "d", "e"])
                
                GameButtonView()

                Spacer()
                
                ScoreView(score: 15)
                
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

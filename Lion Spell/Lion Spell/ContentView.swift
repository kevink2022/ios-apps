//
//  ContentView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // title
            
            FoundWordsView(words: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
            
            CurrentWordView(word: "lorem")
            
            // letter buttons
            
            // backspace / submit buttons
            
            // score display
            
            // new game / hint / prefrences buttons
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

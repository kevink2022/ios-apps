//
//  HintsSheet.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/12/22.
//

import SwiftUI

struct HintsSheet: View
{
    @EnvironmentObject var game : ScrambleGameManager
    
    var body: some View
    {
        Form
        {
            Section(header: Text("SUMMARY"))
            {
                Text("Total number of words: \(game.model.stats.words.count)")
                Text("Total possible points: \(game.model.stats.maxScore)")
                Text("Number of Pangrams: \(game.model.stats.pangrams.count)")
            }
            
            ForEach(game.model.stats.hints.lengths(), id: \.self)
            {
                length in
                
                Section(header: Text("WORDS OF LENGTH: \(length)"))
                {
                    ForEach(game.model.stats.hints)
                    {
                        hint in
                        
                        if (hint.length == length)
                        {
                            Text("\(String(hint.firstLetter)): \(hint.instances.count)")
                        }
                    }
                }
            }
        }
        
        
    }
}

struct HintsSheet_Previews: PreviewProvider {
    static var previews: some View {
        HintsSheet()
    }
}

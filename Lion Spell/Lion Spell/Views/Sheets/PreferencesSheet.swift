//
//  PreferencesSheet.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/12/22.
//

import SwiftUI

struct PreferencesSheet: View
{
    @EnvironmentObject var game : ScrambleGameManager
    
    var body: some View
    {
        Form
        {
            Section(header: Text("Difficulty Level"))
            {
                Picker("Difficulty", selection: $game.preferences.difficulty)
                {
                    ForEach(LionSpellDifficulty.allCases)
                    {
                        Text($0.rawValue.capitalized).tag($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Section(header: Text("Language"))
                {
                    Picker("Language", selection: $game.preferences.language)
                    {
                        ForEach(LionSpellLanguage.allCases)
                        {
                            Text($0.rawValue.capitalized).tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

struct PreferencesSheet_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesSheet()
    }
}

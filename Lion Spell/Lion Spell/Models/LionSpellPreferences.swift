//
//  LionSpellPreferences.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/12/22.
//

import Foundation

struct LionSpellPreferences
{
    var language: LionSpellLanguage = .english
    var difficulty: LionSpellDifficulty = .five
}

enum LionSpellLanguage : String, Identifiable, CaseIterable
{
    case english, french
    var id : RawValue { rawValue }
}

enum LionSpellDifficulty : String, Identifiable, CaseIterable
{
    case five, six, seven
    var id : RawValue { rawValue }
}

extension LionSpellDifficulty
{
    var literal : Int
    {
        switch self
        {
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        }
    }
}


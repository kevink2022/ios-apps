//
//  LionSpellModel.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/30/22.
//

import Foundation


struct LionSpellGame
{
    let letterSet   : Array<String> = []
    let letterCount : Int
        
    init(choices letters: Int)
    {
        letterCount = letters
    }
    
    func checkWord(_ word: String) -> Bool
    {
        if Words.words.contains(word)
        {
            return true
        }
        else
        {
            return false
        }
    }
}

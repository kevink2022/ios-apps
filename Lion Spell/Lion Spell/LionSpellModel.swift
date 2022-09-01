//
//  LionSpellModel.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/30/22.
//

import Foundation


struct LionSpellGame
{
    let letterSet   : Set<Character>
    let letterCount : Int
        
    init(choices letters: Int)
    {
        letterCount = letters
        
        var random          : String
        var potentialSet    : Set<Character>
        
        repeat
        {
            // I understand force unwrapping is dangerous,
            // but I know Words.words will never be empty
            // so it is safe here.
            random = Words.words.randomElement()!
            potentialSet = []
            
            // Check a random word from the list, if it has 5
            // unique characters, make them the character set
            if random.count >= letterCount
            {
                for letter in random
                {
                    if potentialSet.contains(letter)
                    {
                        break
                    }
                    else
                    {
                        potentialSet.insert(letter)
                    }
                    
                    if potentialSet.count == letterCount
                    {
                        break
                    }
                }
                
            }
            
        } while potentialSet.count < letterCount
        
        letterSet = potentialSet
    }
    
    func checkWord(_ word: String) -> Bool
    {
        if word.count > 4 && Words.words.contains(word)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func wordScore(_ word: String) -> Int
    {

        // Check for 5 point bonus
        var score = 5
        for letter in letterSet
        {
            if word.contains(letter) == false
            {
                score = 0
                break
            }
        }
        
        score += word.count
    
        return score
    }
}

//
//  LionSpellModel.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/30/22.
//

import Foundation

struct LionSpellGame
{
    let letterSet           : Array<Letter>
    let letterCount         : Int
    let bonus               : Int
    let minimumWordLength   : Int
    let wordSet             : Array<String>
    let language            : LionSpellLanguage
    let stats               : LionSpellStatistics
    
    init(letterCount letters: Int, bonus bonusPoints: Int, minimumWordLength min: Int, language lang: LionSpellLanguage)
    {
        letterCount         = letters
        bonus               = bonusPoints
        minimumWordLength   = min
        language            = lang
        wordSet             = (lang == .english) ? Words.words : frenchWords
        
        let legalCharSet = LionSpellGame.getLegalLetterSet(letterCount: letters, wordSet: wordSet)
        var legalLetterSet : Array<Letter> = []
        
        for index in 0..<letters
        {
            legalLetterSet.append(Letter(letter: legalCharSet[index]))
        }
        
        letterSet = legalLetterSet
        
        stats = LionSpellGame.initStatistics(letterSet: legalLetterSet, bonusPoints: bonus, wordSet: wordSet)
    }
}

// MARK: Functions
extension LionSpellGame
{
    func checkWord(_ word: String) -> Bool
    {
        if word.count >= minimumWordLength && wordSet.contains(word)
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
        LionSpellGame.staticWordScore(word, bonusPoints: bonus, charSet: letterSet)
    }
    
    private static func staticWordScore(_ word: String, bonusPoints: Int, charSet: Array<Letter>) -> Int
    {

        if word.count == 4
        {
            return 1
        }
        
        // Check for point bonus
        var score = bonusPoints
        for letter in charSet
        {
            if word.contains(letter.letter) == false
            {
                score = 0
                break
            }
        }
        
        score += word.count
    
        return score
    }
    
    // Initializes statics and returns the set of legal words so none of
    // information needs to be recalculated
    private static func initStatistics (letterSet: Array<Letter>, bonusPoints: Int, wordSet: Array<String>) -> LionSpellStatistics
    {
        var stats : LionSpellStatistics = LionSpellStatistics()
        
        for word in wordSet
        {
            if word.contains(letterSet[0].letter) &&  word.filter({!letterSet.asCharacters.contains($0)}).isEmpty
            {
                
                stats.words.append(word)
                stats.hints.appendHint(word)
                stats.maxScore += LionSpellGame.staticWordScore(word, bonusPoints: bonusPoints, charSet: letterSet)
                
                // Check for Panagram
                if letterSet.asCharacters.filter({!word.contains($0)}).isEmpty
                {
                    stats.pangrams.append(word)
                }
            }
        }
        
        return stats
    }
    
    private static func getLegalLetterSet (letterCount: Int, wordSet: Array<String>) -> Array<Character>
    {
        var potentialSet : Array<Character>
        
        repeat
        {
            potentialSet = Array(Set(wordSet.randomElement()!))
        }
        while potentialSet.count != letterCount
        
        return potentialSet.shuffled()
    }
}




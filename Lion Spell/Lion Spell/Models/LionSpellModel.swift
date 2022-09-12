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
    let language            : LionSpellLanguage
    let stats               : LionSpellStatistics
    
    init(letterCount letters: Int, bonus bonusPoints: Int, minimumWordLength min: Int, language lang: LionSpellLanguage)
    {
        letterCount         = letters
        bonus               = bonusPoints
        minimumWordLength   = min
        language            = lang
        
        let legalCharSet = LionSpellGame.getLegalLetterSet(letterCount: letters)
        var legalLetterSet : Array<Letter> = []
        
        for index in 0..<letters
        {
            legalLetterSet.append(Letter(letter: legalCharSet[index]))
        }
        
        letterSet = legalLetterSet
        
        stats = LionSpellGame.initStatistics(letterSet: legalLetterSet, bonusPoints: bonus)
    }
}

// MARK: Computed Vars
extension LionSpellGame
{
    var possibleWords : Int
    {
        12
    }
    
    var possiblePoints : Int
    {
        12
    }
    
    var possiblePanagrams : Int
    {
        12
    }
}

// MARK: Functions
extension LionSpellGame
{
    func possibleWords(startingLetter: Character, wordLength: Int) -> Int
    {
        12
    }
    
    func checkWord(_ word: String) -> Bool
    {
        if word.count >= minimumWordLength && Words.words.contains(word)
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
    private static func initStatistics (letterSet: Array<Letter>, bonusPoints: Int) -> LionSpellStatistics
    {
        var stats : LionSpellStatistics = LionSpellStatistics()
        
        for word in Words.words
        {
            if word.filter({!letterSet.asCharacters.contains($0)}).isEmpty
            {
                
                stats.words.append(word)
                stats.hints.appendHint(word)
                stats.maxScore += LionSpellGame.staticWordScore(word, bonusPoints: bonusPoints, charSet: letterSet)
                
                // Check for Panagram
                if letterSet.asCharacters.filter({!word.contains($0)}).isEmpty
                {
                    stats.panagrams.append(word)
                }
            }
        }
        
        return stats
    }
    
    private static func getLegalLetterSet (letterCount: Int) -> Array<Character>
    {
        var potentialSet : Array<Character>

        repeat
        {
            potentialSet = Array(Set(Words.words.randomElement()!))
        }
        while potentialSet.count < 5
        
        return potentialSet.shuffled()
    }
}

enum LionSpellLanguage
{
    case english, french
}

struct LionSpellStatistics
{
    var words       : Array<String> = []
    var panagrams   : Array<String> = []
    var hints       : Array<LionSpellHint> = []
    var maxScore    : Int = 0
}

extension Array where Element == LionSpellHint
{
    mutating func appendHint(_ newWord: String)
    {
        for index in self.indices
        {
            if self[index].firstLetter == newWord.first && self[index].length == newWord.count
            {
                // Found a hint of the same structure
                self[index].instances.append(newWord)
                return
            }
        }
        
        // Didn't find a hint, adding new one
        self.append(LionSpellHint(length: newWord.count, firstLetter: newWord.first!, instances: [newWord]))
    }
}

struct LionSpellHint : Equatable, Identifiable
{
    let id = UUID()
    let length : Int
    let firstLetter : Character
    var instances : Array<String>
}

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
    let legalWords          : Array<String>
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
        
        (legalWords, stats) = LionSpellGame.initStatistics(letterSet: legalCharSet)
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
    
    static func staticWordScore(_ word: String, bonusPoints: Int, charSet: Array<Letter>) -> Int
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
    private static func initStatistics (letterSet: Array<Letter>, bonusPoints: Int) -> (Array<String>, LionSpellStatistics)
    {
        var legalWords : Array<String> = []
        var stats : LionSpellStatistics = LionSpellStatistics()
        var hint : LionSpellHint
        
        for word in Words.words
        {
            if word.filter({!letterSet.asCharacters.contains($0)}).isEmpty
            {
                legalWords.append(word)
                
                stats.possibleWords.append(word)
                stats.possibleScore += LionSpellGame.staticWordScore(word, bonusPoints: bonusPoints, charSet: letterSet)
                
                // Check for Panagram
                if letterSet.asCharacters.filter({!word.contains($0)}).isEmpty
                {
                    stats.possiblePanagrams.append(word)
                }
                
                if stats.hints.contains(<#T##Self.Element#>)
                
                
            }
        }
        
        return (legalWords, stats)
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
    var possibleWords : Array<String> = []
    var possibleScore : Int = 0
    var possiblePanagrams : Array<String> = []
    var wordLengthPossibilities : Array<LionSpellHint> = []
}

extension Array where Element == LionSpellHint
{
    func exists(_ hint: LionSpellHint) -> Bool
    {
        for hint in self
        {

        }
    }
}

struct LionSpellHint : Equatable, Identifiable
{
    let id : UUID()
    let length : Int
    let firstLetter : Character
    var instances : Int
}

extension LionSpellHint
{
    static func == (lhs: LionSpellHint, rhs: LionSpellHint) -> Bool
    {
        lhs.length == rhs.length &&
        lhs.firstLetter == rhs.firstLetter
    }
}

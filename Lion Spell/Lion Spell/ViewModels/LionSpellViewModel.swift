//
//  LionSpellViewModel.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/30/22.
//

import Foundation

struct InitConstants
{
    static let letterCount = 5
    static let bonus       = 5
    static let minWordLen  = 4
    static let lang : LionSpellLanguage = .english
}

class ScrambleGameManager: ObservableObject
{
    var model = LionSpellGame(
        letterCount:        InitConstants.letterCount,
        bonus:              InitConstants.bonus,
        minimumWordLength:  InitConstants.minWordLen,
        language:           InitConstants.lang
    )
    
    @Published var currentWord = Word()
    var foundWords : Array<Word> = []
    var score : Int = 0
    
    @Published var preferences = LionSpellPreferences() { didSet {newGame()} }
    
    
    //var letterSet : Array<Letter> {model.letterSet}
    
    var submitButtonDisabled : Bool
    {
        // This feels like too much processing for a computed value
        if !currentWord.isContainedIn(foundWords) && model.checkWord(currentWord.string) { return false }
        else { return true }
    }
    
    var backspaceButtonDisabled : Bool { currentWord.count == 0 ? true : false }
}


// MARK: Intents
extension ScrambleGameManager {
    func submit()
    {
        score += model.wordScore(currentWord.string)
        foundWords.append(currentWord)
        currentWord = Word()
    }
    
    func addLetter(_ letter: Character)
    {
        currentWord.append(Letter(letter: letter))
    }
    
    func backspace()
    {
        currentWord.backspace()
    }
    
    func newGame()
    {
        model = LionSpellGame(
            letterCount:        preferences.difficulty.literal,
            bonus:              InitConstants.bonus,
            minimumWordLength:  InitConstants.minWordLen,
            language:           preferences.language
        )
        
        foundWords = []
        currentWord = Word()
        score = 0
    }
}

struct ScramblePreferences
{
    
    
    
}


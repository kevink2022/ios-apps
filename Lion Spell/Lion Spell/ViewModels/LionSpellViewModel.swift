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
}

class ScrambleGameManager: ObservableObject
{
    var game = LionSpellGame(
        letterCount: InitConstants.letterCount,
        bonus: InitConstants.bonus,
        minimumWordLength: InitConstants.minWordLen
    )
    
    @Published var currentWord = Word()
    var foundWords : Array<Word> = []
    var score : Int = 0
    
    var letterSet : Array<Letter> {game.letterSet}
    
    var submitButtonDisabled : Bool
    {
        // This feels like too much processing for a computed value
        if !currentWord.isContainedIn(foundWords) && game.checkWord(currentWord.string) { return false }
        else { return true }
    }
    
    var backspaceButtonDisabled : Bool { currentWord.count == 0 ? true : false }
}


// MARK: Intents
extension ScrambleGameManager {
    func submit()
    {
        score += game.wordScore(currentWord.string)
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
        game = LionSpellGame(
            letterCount: InitConstants.letterCount,
            bonus: InitConstants.bonus,
            minimumWordLength: InitConstants.minWordLen
        )
        
        foundWords = []
        currentWord = Word()
        score = 0
    }
}



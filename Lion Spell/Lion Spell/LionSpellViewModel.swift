//
//  LionSpellViewModel.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/30/22.
//

import Foundation

class ScrambleGameManager : ObservableObject
{
    var game = LionSpellGame(choices: 5)
    
    @Published var currentWord = Word()
    var foundWords : Array<Word> = []
    var score : Int = 0
    
    var letterSet : Array<Letter> {game.letterSet}
    
    var submitButtonEnabled : Bool
    {
        // This feels like too much processing for a computed value
        game.checkWord(currentWord.string)
    }
    
    var deleteButtonEnabled : Bool
    {
        if currentWord.count == 0
        {
            return false
        }
        else
        {
            return true
        }
    }
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
        game = LionSpellGame(choices: 5)
        foundWords = []
        currentWord = Word()
        score = 0
    }
}

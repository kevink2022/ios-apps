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
    
    @Published var currentWord : Array<Character> = []
    var foundWords : Array<String> = []
    var score : Int = 0
    
    // Would like this to be a let
    var letterSet : Array<Character> {game.letterSet}
    
    var submitButtonEnabled : Bool
    {
        // This feels like too much processing for a computed value
        game.checkWord(String(currentWord))
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
    
    /* --- BUTTONS --- */
    
    func submit()
    {
        score += game.wordScore(String(currentWord))
        foundWords.append(String(currentWord))
        currentWord = []
    }
    
    func addLetter(_ letter: String)
    {
        currentWord += letter
    }
    
    func delete()
    {
        currentWord.remove(at: currentWord.endIndex)
    }
    
    func newGame()
    {
        game = LionSpellGame(choices: 5)
        foundWords = []
        currentWord = []
        score = 0
    }
    
    
    // Getters
    
    // Setters
    
}



//
//  ScrambleTypes.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/6/22.
//

import Foundation

// MARK: Letter Struct
struct Letter : Identifiable
{
    let letter : Character
    let id : UUID = UUID()
}

extension Array where Element == Letter
{
    var asCharacters : Array<Character>
    {
        var characters : Array<Character> = []
        
        for letter in self
        {
            characters.append(letter.letter)
        }
        
        return characters
    }
}

// MARK: Word Struct
struct Word : Identifiable
{
    var letters : Array<Letter> = []
    let id : UUID = UUID()
}


extension Word //Computed Properties
{
    var string : String
    {
        var string = ""
        
        for letter in self.letters {
            string += String(letter.letter)
        }
        
        return string
    }
    
    var count : Int { letters.count }
}

extension Word //Functions
{
    mutating func append (_ letter: Letter)
    {
        self.letters.append(letter)
    }
    
    mutating func backspace ()
    {
        self.letters.removeLast()
    }
    
    func isContainedIn (_ wordList: Array<Word>) -> Bool
    {
        for word in wordList
        {
            if word.string == self.string
            {
                return true
            }
        }
        
        return false
    }
}

extension Array where Element == Word
{
    var asCharacters : Array<String>
    {
        var strings : Array<String> = []
        
        for word in self
        {
            strings.append(word.string)
        }
        
        return strings
    }
}


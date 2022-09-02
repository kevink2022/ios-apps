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
    let bonus               : Int = 5
    let minimumWordLength   : Int = 4
    
    init(choices letters: Int)
    {
        letterCount = letters
        
        let legalCharSet = LionSpellGame.getLegalLetterSet(letterCount: letters)
        var legalLetterSet : Array<Letter> = []
        
        for index in 0..<letters
        {
            legalLetterSet.append(Letter(letter: legalCharSet[index]))
        }
        
        letterSet = legalLetterSet
    }
}

// MARK: Functions
extension LionSpellGame {
    
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

        // Check for point bonus
        var score = bonus
        for letter in letterSet
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
    
    private static func getLegalLetterSet (letterCount: Int) -> Array<Character>
    {
        var random          : String
        var potentialSet    : Array<Character>
        
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
                    // If character is not unique, break
                    if potentialSet.contains(letter)
                    {
                        break
                    }
                    // Else, add the unique character to the potential set
                    else
                    {
                        potentialSet.append(letter)
                    }
                    
                    // If the desired number of unique letters has been
                    // found, break
                    if potentialSet.count == letterCount
                    {
                        break
                    }
                }
                
            }
            
        // Loop until a valid set has been found
        } while potentialSet.count < letterCount
        
        return potentialSet.shuffled()
    }
}


// MARK: Letter Struct
struct Letter : Identifiable
{
    let letter : Character
    let id : UUID = UUID()
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
}

//
//  LionSpellStatistics.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/12/22.
//

import Foundation

struct LionSpellStatistics
{
    var words       : Array<String> = []
    var pangrams    : Array<String> = []
    var hints       : Array<LionSpellHint> = []
    var maxScore    : Int = 0
}

struct LionSpellHint : Equatable, Identifiable
{
    let id = UUID()
    let length : Int
    let firstLetter : Character
    var instances : Array<String>
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
    
    //mutating func

    func lengths () -> Array<Int>
    {
        var len: Array<Int> = []
        
        for hint in self
        {
            if !len.contains(hint.length)
            {
                len.append(hint.length)
            }
        }
    
        return len.sorted()
    }
}

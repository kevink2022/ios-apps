//
//  Artist.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/3/22.
//

import Foundation

class Artist : Identifiable
{
    var name : String
    var id : String { name }
 
    init(name: String)
    {
        self.name = name
    }
}


extension Artist
{
    static let ratatat = Artist(name: "Ratatat")
    
    static let unknown = Artist(name: "Unknown Artist")
}

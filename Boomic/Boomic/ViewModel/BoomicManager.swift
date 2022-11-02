//
//  BoomicManager.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/2/22.
//

import Foundation

class BoomicManager : ObservableObject
{
    @Published var library : BoomicLibrary
    
    init()
    {
        library = BoomicLibrary(songs: [], albums: [], artists: [])
    }
}

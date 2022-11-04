//
//  BoomicLibrary.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/2/22.
//

import Foundation

struct BoomicLibrary
{
    var songs : [Song]
    var albums : [Album]
    var artists : [Artist]
    
    enum SupportedFileFormats : String, CaseIterable
    {
        case flac, m4a
    }
}



//
//  BoomicSettings.swift
//  Boomic
//
//  Created by Kevin Kelly on 12/10/22.
//

import Foundation

/// I am going with this instead of @AppStorage since this will nicely be
///  saved in the library, and then can be shared that way.
struct BoomicSettings : Codable
{
    var songGUI : SongGUI
    var classicTimeSlider : ClassicTimeSlider
    var albumCover : AlbumCover
}

// statics
extension BoomicSettings
{
    static let defaultSettings = BoomicSettings(
        songGUI: .classic,
        classicTimeSlider: .classic,
        albumCover: .notGestured
    )
}

// inits
extension BoomicSettings
{
    
}

// Options ENUMS
extension BoomicSettings
{
    enum SongGUI : String, CaseIterable, Codable, Identifiable
    {
        case classic, gesture
        
        var id : String { self.rawValue }
    }
    
    enum ClassicTimeSlider : String, CaseIterable, Codable, Identifiable
    {
        case classic, scrolling
        
        var id : String { self.rawValue }
    }
    
    enum AlbumCover : String, CaseIterable, Codable, Identifiable
    {
        case notGestured, gestured
        
        var id : String { self.rawValue }
    }
}

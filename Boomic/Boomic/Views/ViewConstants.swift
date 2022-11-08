//
//  ViewConstants.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

/// View Constants Organization
///     - C: Each File gets its own constants struct, aliased with C
///     - F: Each subgroup get a fonts struct, which may borrow from the root fonts, aliased with F
///     - P: Placeholders for development, and when metadata is unavailable, aliased with P

struct ViewConstants
{
    /// For general placeholder text/images
    struct Placeholders
    {
        struct Unknown
        {
            static let artist = "Unknown Artist"
            static let album = "Unknown Album"
        }
    }
    
    struct Menus
    {
        struct Fonts
        {
            static let title = Font.system(.title3, design: .default, weight: .semibold)
            static let artist = Font.system(.subheadline, design: .default, weight: .regular)
        }
        
        struct SongListItem
        {
            static let height : CGFloat = 45
        }
    }
    
    struct Subviews
    {
        struct AlbumCover
        {
            static let padding : CGFloat = 2
            static let cornerRadius : CGFloat = 5
            static let defaultAlbumCover : String = "ratatat-magnifique"
        }
        
        struct BoomicSlider
        {
            static let frame : CGFloat = 10
        }
    }
    
    struct Classic_GUI
    {
        struct Fonts
        {
            static let title = Font.system(.largeTitle, design: .default, weight: .bold)
            static let artist = Font.system(.title3, design: .default, weight: .light)
            static let album = Font.system(.title3, design: .default, weight: .light)
            static let time = Font.system(.body, design: .default, weight: .light)
            static let mediaControls = Font.system(.largeTitle, design: .default, weight: .heavy)
            static let queueControls = Font.system(.title, design: .default, weight: .bold)
        }
        
        struct ClassicSongView
        {
            
        }
        
        struct Subviews
        {
            struct ClassicMediaControls
            {
                static let playSF = "play.fill"
                static let pauseSF = "pause.fill"
                static let lastSongSF = "backward.fill"
                static let nextSongSF = "forward.fill"
                static let color = Color.primary
            }
            
            struct ClassicVolumeSlider
            {
                static let lowVolumeSF = "speaker.wave.1.fill"
                static let highVolumeSF = "speaker.wave.3.fill"
            }
            
            struct ClassicQueueControls
            {
                static let shuffleSF = "shuffle"
                static let repeatSF = "repeat"
                static let repearOneSF = "repeat.1"
                static let queueSF = "list.triangle"
            }
        }
    }
}

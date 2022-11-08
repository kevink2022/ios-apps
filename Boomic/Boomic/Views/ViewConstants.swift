//
//  ViewConstants.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

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
    }
    
    struct Classic_GUI
    {
        struct Fonts
        {
            static let title = Font.system(.largeTitle, design: .default, weight: .bold)
            static let artist = Font.system(.title3, design: .default, weight: .light)
            static let album = Font.system(.title3, design: .default, weight: .light)
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
                static let font = Font.system(.largeTitle, design: .default, weight: .bold)
                static let color = Color.primary
            }
        }
    }
}

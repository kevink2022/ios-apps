//
//  SongListItem.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/4/22.
//

import SwiftUI

struct SongListItem: View
{
    let song : Song
    let selected : Bool
    
    init(song: Song, selected: Bool = false)
    {
        self.song = song
        self.selected = selected
    }
    
    var body: some View
    {
        ZStack
        {
            HStack
            {
                AlbumCover(image: nil)
                
                VStack(alignment: .leading)
                {
                    Text(song.title ?? song.filename)
                        .font(F.title)
                    
                    Text(song.artist?.name ?? P.Unknown.artist)
                        .font(F.artist)
                }
                .foregroundColor(selected ? .accentColor : .primary)
                
                Spacer()
            }
        }
        .frame(height: C.height)
        .clipped()
    }
    
    typealias C = ViewConstants.Menus.SongListItem
    typealias F = ViewConstants.Menus.Fonts
    typealias P = ViewConstants.Placeholders
}

struct SongListItem_Previews: PreviewProvider {
    static var previews: some View {
        SongListItem(song: Song.standard)
    }
}

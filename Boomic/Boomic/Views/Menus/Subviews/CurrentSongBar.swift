//
//  CurrentSongBar.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/8/22.
//

import SwiftUI

struct CurrentSongBar: View
{
    let song : Song
    
    var body: some View
    {
        ZStack
        {
            ImageBlurBackground(image: "ratatat-classics")
                .clipped()
            
            HStack
            {
                AlbumCover(image: "ratatat-classics")
                
                VStack(alignment: .leading)
                {
                    Text(song.title ?? song.filename)
                        .font(F.title)
                    
                    Text(song.artistName ?? P.Unknown.artist)
                        .font(F.artist)
                }
                .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .padding(.horizontal)
            }
            .padding()
        
        }
        .frame(height: C.height)
    }
    
    typealias C = ViewConstants.Menus.SongListItem
    typealias F = ViewConstants.Menus.Fonts
    typealias P = ViewConstants.Placeholders
}

struct CurrentSongBar_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSongBar(song: Song.standard)
        CurrentSongBar(song: Song.standard).preferredColorScheme(.dark)

    }
}

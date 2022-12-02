//
//  CurrentSongBar.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/8/22.
//

import SwiftUI

struct CurrentSongBar: View
{
    @EnvironmentObject var manager : BoomicManager
    let song : Song
    
    var body: some View
    {
        ZStack
        {
            ImageBlurBackground(image: song.albumCover)
                .clipped()
            
            HStack
            {
                AlbumCover(image: song.albumCover)
                
                VStack(alignment: .leading)
                {
                    Text(song.titleLabel)
                        .font(F.title)
                    
                    Text(song.artistLabel)
                        .font(F.artist)
                }
                .foregroundColor(.primary)
                
                Spacer()
                
                Button
                {
                    manager.togglePlayback()
                }
                label:
                {
                    Image(systemName: manager.isPlaying ? "pause.fill" : "play.fill")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                }
            }
            .padding()
        
        }
        .frame(height: C.height)
    }
    
    typealias C = ViewConstants.Menus.SongListItem
    typealias F = ViewConstants.Menus.Fonts
}

struct CurrentSongBar_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSongBar(song: Song.standard)
        CurrentSongBar(song: Song.standard).preferredColorScheme(.dark)
    }
}

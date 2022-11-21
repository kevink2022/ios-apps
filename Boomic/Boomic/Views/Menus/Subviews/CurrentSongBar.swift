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
            ImageBlurBackground(image: nil)
                .clipped()
            
            HStack
            {
                AlbumCover(image: nil)
                
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
                    Image(systemName: !manager.isPlaying ? "pause.fill" : "play.fill")
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
    typealias P = ViewConstants.Placeholders
}

struct CurrentSongBar_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSongBar(song: Song.standard)
        CurrentSongBar(song: Song.standard).preferredColorScheme(.dark)
    }
}

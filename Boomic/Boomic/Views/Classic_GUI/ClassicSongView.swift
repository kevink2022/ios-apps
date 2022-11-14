//
//  ClassicSongView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

struct ClassicSongView: View
{
    let song : Song
    
    var body: some View
    {
        ZStack
        {
            ImageBlurBackground(image: nil)
            
            VStack(alignment: .leading)
            {
                AlbumCover(image: nil)
                
                ClassicTitles(song: song)
                
                ClassicTimeSlider()
                    .padding()
                
                ClassicMediaControls()
                    .padding(.vertical)
                
                ClassicVolumeSlider()
                    .padding()
                
                ClassicQueueControls()
                    .padding(.top)
            }
        }
    }
}

struct ClassicSongView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSongView(song: Song.standard)
            .environmentObject(BoomicManager())
        ClassicSongView(song: Song.standard).preferredColorScheme(.dark)
            .environmentObject(BoomicManager())
    }
}


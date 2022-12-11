//
//  Gesture_GUI.swift
//  Boomic
//
//  Created by Kevin Kelly on 12/7/22.
//

import SwiftUI

struct Gesture_GUI: View
{
    @EnvironmentObject var manager : BoomicManager
    let song : Song
    
    var body: some View
    {
        ZStack
        {
            VStack
            {
                //GesturedAlbumCover()
                StaticAlbumCover(image: song.albumCover)
                
                ZStack
                {
                    HStack
                    {
                        ScrollingTimeView(
                            percent: $manager.songProgress,
                            samples: manager.audioLevelSamples,
                            frame: 140,
                            vertical: true
                        )
                        
                        GestureVolumeSlider()
                    }
                    
                    Image(systemName: "play.fill")
                }
                
                ClassicTitles(song: song)
            }
        }
    }
}

struct Gesture_GUI_Previews: PreviewProvider {
    static var previews: some View {
        Gesture_GUI(song: Song.standard)
    }
}

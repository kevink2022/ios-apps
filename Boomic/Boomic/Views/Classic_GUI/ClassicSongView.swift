//
//  ClassicSongView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

struct ClassicSongView: View
{
    @EnvironmentObject var manager : BoomicManager
    let song : Song
    
    var body: some View
    {
        ZStack
        {
            ImageBlurBackground(image: song.albumCover)
            
            VStack(alignment: .leading)
            {
                if manager.showQueueSheet
                {
                    QueueListView()
                    
                    Button
                    {
                        withAnimation { manager.showQueueSheet.toggle() }
                    }
                    label:
                    {
                        SongListItem(song: song)
                    }
                    .padding(.horizontal)
                }
                else
                {
                    AlbumCover()
                    
                    SongTitles(song: song)
                }
                
                if manager.songExists
                {
                    ClassicTimeSlider()
                }
                else
                {
                    HStack
                    {
                        Spacer()
                        Image(systemName: "externaldrive.trianglebadge.exclamationmark")
                        Text("The song file cannot be found")
                        Spacer()
                    }
                }
                
                ClassicMediaControls()
                    .padding(.vertical)
                
                ClassicVolumeSlider()
                    .padding()
                
                ClassicQueueControls()
                    .padding(.top)
            }
        }
//        .sheet(isPresented: $manager.showQueueSheet)
//        {
//            SongListView(songs: manager.queue)
//        }
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


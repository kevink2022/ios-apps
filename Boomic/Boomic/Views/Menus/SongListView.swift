//
//  SongListView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/2/22.
//

import SwiftUI

struct SongListView: View
{
    @EnvironmentObject var manager : BoomicManager
    @State var showSheet : Bool = false
    let queue : [Song]
    
    
    var body: some View
    {
        VStack
        {
            List
            {
                ForEach(queue.indices)
                {
                    index in let song = queue[index]
                    
                    Button
                    {
                        manager.selectSong(queue: queue, queueIndex: index)
                        showSheet = true
                    }
                    label:
                    {
                        SongListItem(song: song)
                    }
                }
            }
            .listStyle(.inset)
            
            Button
            {
//                manager.setSong(song: Song.standard)
                showSheet = true
            }
            label:
            {
                CurrentSongBar(song: Song.standard)
                    .ignoresSafeArea()
            }
        }
        .sheet(isPresented: $showSheet)
        {
            //ClassicSongView(song: manager.currentSong!)
            ClassicSongView(song: Song.standard)
        }
        
    }
}

//struct SongListView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        SongListView(queue: manager.songs)
//            .environmentObject(BoomicManager())
//        SongListView(songs: manager.songs)
//            .environmentObject(BoomicManager())
//            .preferredColorScheme(.dark)
//    }
//}

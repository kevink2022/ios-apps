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
                showSheet = true
            }
            label:
            {
                if let song = manager.currentSong
                {
                    CurrentSongBar(song: song)
                        .ignoresSafeArea()
                }
            }
        }
        .sheet(isPresented: $showSheet)
        {
            if let song = manager.currentSong
            {
                ClassicSongView(song: song)
                    //.ignoresSafeArea()
            }
            
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

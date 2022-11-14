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
    
    
    var body: some View
    {
        VStack
        {
            List
            {
                ForEach(manager.songs)
                {
                    song in
                    
                    Button
                    {
                        manager.setSong(song: song)
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
                manager.setSong(song: Song.standard)
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

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
            .environmentObject(BoomicManager())
        SongListView()
            .environmentObject(BoomicManager())
            .preferredColorScheme(.dark)
    }
}

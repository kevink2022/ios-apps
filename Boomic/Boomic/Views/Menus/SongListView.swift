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
        List
        {
            Button
            {
                manager.getMetadata()
            }
            label:
            {
                Text("metadata")
            }
            
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
                    Text(song.title ?? song.source.relativeString.replacingOccurrences(of: "%20", with: " "))
                }
            }
        }
        .sheet(isPresented: $showSheet)
        {
            ClassicSongView(song: manager.currentSong!)
        }
        
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}

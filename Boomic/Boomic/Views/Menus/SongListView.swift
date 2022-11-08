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

//
//  MainView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

struct MainView: View
{
    @EnvironmentObject var manager : BoomicManager
    
    var body: some View
    {
        VStack
        {
            CategoriesView()
            
            if let song = manager.currentSong
            {
                Button
                {
                    manager.showCurrentSongSheet = true
                }
                label:
                {
                    CurrentSongBar(song: song)
                }
            }
        }
        .sheet(isPresented: $manager.showCurrentSongSheet)
        {
            if let song = manager.currentSong
            {
                CurrentSongView(song: song)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  ClassicSongView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

struct ClassicSongView: View
{
    typealias C = ViewConstants.Classic_GUI.ClassicSongView
    let song : Song
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            AlbumCover(image: "ratatat-magnifique")
            
            
            VStack(alignment: .leading)
            {
                //TODO: add defaults
                Text(song.name ?? "No name") //default - filename
                    .font(C.Fonts.title)
                
                Text(song.artist?.name ?? "No artist")
            }
            .padding(.horizontal)
            
            
            
        }
    }
}

struct ClassicSongView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSongView(song: Song.standard)
    }
}

extension ViewConstants.Classic_GUI
{
    
}

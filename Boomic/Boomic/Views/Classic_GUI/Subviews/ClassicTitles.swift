//
//  ClassicTitles.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/2/22.
//

import SwiftUI

struct ClassicTitles: View
{
    let song : Song
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            //TODO: add defaults
            Text(song.name ?? "No name") //default - filename
                .font(F.title)
            
            Text(song.album?.name ?? "No album found")
                .font(F.album)
            
            Text(song.artist?.name ?? "No artist found")
                .font(F.artist)
        }
        .padding(.horizontal)
    }
    
    typealias F = ViewConstants.Classic_GUI.Fonts
}

struct ClassicTitles_Previews: PreviewProvider {
    static var previews: some View {
        ClassicTitles(song: Song.standard)
    }
}

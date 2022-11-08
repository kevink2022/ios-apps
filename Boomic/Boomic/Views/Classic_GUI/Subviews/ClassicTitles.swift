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
            Text(song.title ?? song.filename) //default - filename
                .font(F.title)
            
            Text(song.album ?? P.album)
                .font(F.album)
            
            Text(song.artist ?? P.artist)
                .font(F.artist)
        }
        .padding(.horizontal)
    }
    
    typealias F = ViewConstants.Classic_GUI.Fonts
    typealias P = ViewConstants.Placeholders.Unknown
}

//struct ClassicTitles_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassicTitles(song: Song.standard)
//    }
//}

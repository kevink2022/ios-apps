//
//  ClassicSongView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

struct ClassicSongView: View
{
    typealias F = ViewConstants.Classic_GUI.Fonts
    let song : Song
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            AlbumCover(image: "ratatat-magnifique")
            
            ClassicTitles(song: song)
            
            ClassicMediaControls()
            
            
            
        }
    }
}

struct ClassicSongView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSongView(song: Song.standard)
        ClassicSongView(song: Song.standard).preferredColorScheme(.dark)
    }
}


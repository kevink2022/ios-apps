//
//  ClassicSongView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

struct ClassicSongView: View
{
    @EnvironmentObject var manager : BoomicManager
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


//
//  SongListItem.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/4/22.
//

import SwiftUI

struct SongListItem: View
{
    let song : Song
    
    var body: some View
    {
        HStack
        {
            AlbumCover(image: "ratatat-magnifique")
            
            VStack(alignment: .leading)
            {
                Text(song.title ?? song.filename)
                    .font(F.title)
                
                Text(song.artist ?? P.Unknown.artist)
                    .font(F.artist)
            }
            
            Spacer()
        }
        .frame(height: C.height)
    }
    
    typealias C = ViewConstants.Menus.SongListItem
    typealias F = ViewConstants.Menus.Fonts
    typealias P = ViewConstants.Placeholders
}

//struct SongListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        SongListItem(song: Song.standard)
//    }
//}

//
//  ArtistListView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/14/22.
//

import SwiftUI

struct ArtistListView: View
{
    @EnvironmentObject var manager : BoomicManager
    
    var body: some View
    {
        VStack
        {
            GridMenu
            {
                ForEach(manager.artists)
                {
                    artist in
                    
                    NavigationLink
                    {
                        AlbumListView(albums: artist.albums)
                    }
                    label:
                    {
                        ArtistListItem(artist: artist)
                    }
                }
            }
        }
    }
}

struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView()
    }
}

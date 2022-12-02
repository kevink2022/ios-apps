//
//  CategoriesaView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/10/22.
//

import SwiftUI

struct CategoriesView: View
{
    @EnvironmentObject var manager : BoomicManager
    
    var body: some View
    {
        NavigationStack
        {
            VStack(alignment: .leading)
            {
                Text("Boomic Music")
                .font(.system(.largeTitle, design: .default, weight: .heavy))
                .padding()
                
                GridMenu
                {
                    NavigationLink
                    {

                    }
                    label:
                    {
                        CategoryView(category: .playlists)
                    }

                    NavigationLink
                    {
                        SongListView(songs: manager.library.songs)
                    }
                    label:
                    {
                        CategoryView(category: .songs)
                    }

                    NavigationLink
                    {
                        AlbumListView(albums: manager.library.albums)
                    }
                    label:
                    {
                        CategoryView(category: .albums)
                    }

                    NavigationLink
                    {
                        ArtistListView()
                    }
                    label:
                    {
                        CategoryView(category: .artists)
                    }
                }
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(BoomicManager())
    }
}

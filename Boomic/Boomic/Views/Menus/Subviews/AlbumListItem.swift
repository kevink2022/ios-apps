//
//  AlbumListItem.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/14/22.
//

import SwiftUI

struct AlbumListItem: View
{
    let album: Album
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            AlbumCover(image: album.albumCover)
            
            Text(album.title)
                .font(F.title)
                .lineLimit(1)
            
            Text(album.artist?.name ?? Artist.unknown.name)
                .font(F.artist)
        }
        .foregroundColor(.primary)
    }
    
    typealias F = ViewConstants.Menus.Fonts
    typealias C = ViewConstants.Menus.AlbumListItem
}

struct AlbumListItem_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListItem(album: Album.magnifique)
    }
}

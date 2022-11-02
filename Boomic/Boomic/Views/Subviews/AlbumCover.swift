//
//  AlbumCover.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

struct AlbumCover: View
{
    typealias C = ViewConstants.Subviews.AlbumCover
    let image : String?
    
    var body: some View
    {
        //TODO: ADD DEFAULT
        Image(image ?? C.defaultAlbumCover)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(C.cornerRadius)
            .padding(C.padding)
    }
}

struct AlbumCover_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCover(image: "ratatat-magnifique")
        AlbumCover(image: "ratatat-magnifique").preferredColorScheme(.dark)
    }
}

extension ViewConstants.Subviews
{
    
}

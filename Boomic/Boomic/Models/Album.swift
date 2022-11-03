//
//  Album.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/3/22.
//

import Foundation

class Album : Identifiable
{
    var name : String
    var artist : Artist?
    var trackCount : Int?
    var albumCover : CoverImage?
    
    var id : String { name + (artist?.name ?? Artist.unknown.name) }
    
    
    init(name: String, artist: Artist? = nil, trackCount: Int? = nil, albumCover: CoverImage? = nil) {
        self.name = name
        self.artist = artist
        self.trackCount = trackCount
        self.albumCover = albumCover
    }
    
    
    enum CoverImage
    {
        // Development Only
        case asset(String)
        // Local Storage
        case path(URL)
        // Streaming Source
    }
    
    
}


extension Album
{
    static let unknown = Album(
        name: "Unknown Album",
        artist: Artist.unknown,
        trackCount: nil,
        albumCover: nil)
    
    static let magnifique = Album(
        name: "Magnifique",
        artist: Artist.ratatat,
        trackCount: 14,
        albumCover: .asset("ratatat-magnifique")
    )
}

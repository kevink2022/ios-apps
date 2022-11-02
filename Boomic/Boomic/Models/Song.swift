//
//  Song.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import Foundation

struct Song
{
    var name : String?
    var artist : Artist?
    var album : Album?
    var trackNo : Int?
    var source : Source
    
    enum Source
    {
        // Development Only
        case asset(String)
        // Local Storage
        case path(URL)
        // Streaming Source
    }
    
    static let standard = Song(
        name: "Abrasive",
        artist: Artist.ratatat,
        album: Album.magnifique,
        trackNo: 4,
        source: .asset(""))
}

struct Album
{
    var name : String
    var artist : Artist?
    var trackCount : Int?
    var albumCover : CoverImage?
    
    enum CoverImage
    {
        // Development Only
        case asset(String)
        // Local Storage
        case path(URL)
        // Streaming Source
    }
    
    static let magnifique = Album(
        name: "Magnifique",
        artist: Artist.ratatat,
        trackCount: 14,
        albumCover: .asset("ratatat-magnifique")
    )
}

struct Artist
{
    var name : String
    
    static let ratatat = Artist(name: "Ratatat")
}

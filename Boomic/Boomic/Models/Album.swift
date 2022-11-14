//
//  Album.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/3/22.
//

import Foundation

class Album : Identifiable, Codable
{
    var title : String
    var trackCount : Int?
    var artistName : String?
    //var albumCover : CoverImage?
    
    var artist : Artist?
    var songs : [Song] = []
    
    var id : String { title + (artist?.name ?? Artist.unknown.name) }
    
    
    init(title: String, artist: Artist? = nil, trackCount: Int? = nil) {
        self.title = title
        self.artist = artist
        self.trackCount = trackCount
    }

}


extension Album
{
    func addSong(_ song: Song)
    {
        self.songs.append(song)
        song.album = self
    }
    
    static let unknown = Album(
        title: "Unknown Album",
        artist: Artist.unknown,
        trackCount: nil)
    
    static let magnifique = Album(
        title: "Magnifique",
        artist: Artist.ratatat,
        trackCount: 14
    )
}

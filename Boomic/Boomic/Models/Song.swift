//
//  Song.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import Foundation

class Song : Identifiable, Codable
{
    var source : URL
    var id : URL { source }
    
    var title : String?
    var artist : String?
    var album : String?
    var trackNo : Int?
    
    init(source: URL, name: String? = nil, artist: String? = nil, album: String? = nil, trackNo: Int? = nil)
    {
        self.source = source
        self.title = name
        self.artist = artist
        self.album = album
        self.trackNo = trackNo
    }
}

extension Song
{
    static let standard = Song(
        source: URL(string: "")!,
        name: "Abrasive",
        artist: "Ratatat",
        album: "Magnifique",
        trackNo: 4
    )
//    static let standard = Song(
//        name: "Abrasive",
//        artist: Artist.ratatat,
//        album: Album.magnifique,
//        trackNo: 4,
//        source: URL(string: "")!
//    )
}

extension Song
{
    convenience init(source: URL, tags dict: Dictionary<String,Any>)
    {
        let song = Song(source: source)
        
        song.artist = dict["artist"] as? String
        song.title = dict["title"] as? String
        song.album = dict["album"] as? String
        song.trackNo = dict["track number"] as? Int
        
        self.init(
            source: song.source,
            name: song.title,
            artist: song.artist,
            album: song.album,
            trackNo: song.trackNo
        )
    }
    
    //    mutating func autoTag(song: Song, format: BoomicLibrary.SupportedFileFormats)
    //    {
    //
    //    }
}

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
    var artistName : String?
    var albumTitle : String?
    var trackNo : Int?
    
    var album: Album? = nil
    var artist: Artist? = nil
    
    init(source: URL, name: String? = nil, artist: String? = nil, album: String? = nil, trackNo: Int? = nil)
    {
        self.source = source
        self.title = name
        self.artistName = artist
        self.albumTitle = album
        self.trackNo = trackNo
        self.album = nil
        self.title = nil
    }
    
    var filename : String { self.source.relativeString.replacingOccurrences(of: "%20", with: " ") }
}

extension Song
{
    static let standard = Song(
        source: URL.documentsDirectory,
        name: "Abrasive",
        artist: "Ratatat",
        album: "Magnifique",
        trackNo: 4
    )
    
    // Since Each song needs a source
    static let unknown = Song(
        source: URL(string: "")!,
        name: "",
        artist: "Unknown Artist",
        album: "Unknown Album",
        trackNo: 0
    )
    
//    static let standard = Song(
//        title: "Abrasive",
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
        
        song.artistName = dict["artist"] as? String
        song.title = dict["title"] as? String
        song.albumTitle = dict["album"] as? String
        song.trackNo = dict["track number"] as? Int
        
        self.init(
            source: song.source,
            name: song.title,
            artist: song.artistName,
            album: song.albumTitle,
            trackNo: song.trackNo
        )
    }
    
    //    mutating func autoTag(song: Song, format: BoomicLibrary.SupportedFileFormats)
    //    {
    //
    //    }
}

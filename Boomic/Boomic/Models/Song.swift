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
    
    // MARK: Calculated
    var filename : String { self.source.relativeString.replacingOccurrences(of: "%20", with: " ") }
    
    var titleLabel : String { self.title ?? self.filename }
    var albumLabel : String { self.album?.title ?? self.albumTitle ?? ViewConstants.Placeholders.Unknown.album }
    var artistLabel : String { self.artist?.name ?? self.artistName ?? ViewConstants.Placeholders.Unknown.artist }
    
    init(source: URL, songTitle: String? = nil, artistName: String? = nil, albumTitle: String? = nil, trackNo: Int? = nil)
    {
        self.source = source
        self.title = songTitle
        self.artistName = artistName
        self.albumTitle = albumTitle
        self.trackNo = trackNo
        self.album = nil
        self.artist = nil
    }
}

extension Song
{
    static let standard = Song(
        source: URL.documentsDirectory,
        songTitle: "Abrasive",
        artistName: "Ratatat",
        albumTitle: "Magnifique",
        trackNo: 4
    )
    
    // Since Each song needs a source
    static let unknown = Song(
        source: URL(string: "")!,
        songTitle: "",
        artistName: "Unknown Artist",
        albumTitle: "Unknown Album",
        trackNo: 0
    )
    
//    static let standard = Song(
//        songTitle: "Abrasive",
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
//        let song = Song(source: source)
//
//        song.artistName = dict["artist"] as? String
//        song.title = dict["title"] as? String
//        song.albumTitle = dict["album"] as? String
//        song.trackNo = dict["track number"] as? Int
//
//        if let title = dict["title"] as? String
//        {
//            song.title = (title)
//        }

        self.init(
            source: source,
            songTitle: dict["title"] as? String,
            artistName: dict["artist"] as? String,
            albumTitle: dict["album"] as? String,
            trackNo: dict["track number"] as? Int
        )
    }
    
    //    mutating func autoTag(song: Song, format: BoomicLibrary.SupportedFileFormats)
    //    {
    //
    //    }
}

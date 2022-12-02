//
//  BoomicManager.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/2/22.
//

import Foundation
import AVFoundation
import MediaPlayer

class BoomicManager : ObservableObject
{
    // MARK: - Model Objects
    @Published var library : BoomicLibrary
    
    // MARK: - Audio Engine Objects
    @Published var player : AVPlayer
    var commandCenter : MPRemoteCommandCenter
    
    // MARK: - Playback State
    @Published var queue : [Song] = []
    var inlineQueue : [Song] = []
    @Published var currentSongIndex : Int? = nil
    @Published var shuffleState : Shuffle = .inOrder
    @Published var repeatState : Repeat = .dontRepeat
    
    // MARK: - View State
    @Published var showCurrentSongSheet : Bool = false
    @Published var showQueueSheet : Bool = false
    
    // MARK: - File Management
//    var fileManager = FileManager()
    let storage : StorageManager<BoomicLibrary>

    init()
    {
        let _ = BoomicManager.initAudioSession()
        
        player = AVPlayer()
        library = BoomicLibrary.empty
        storage = StorageManager<BoomicLibrary>(fileName: "library")
        
        commandCenter = MPRemoteCommandCenter.shared()
        let _ = initCommandCenter()
        
        if let library = storage.modelData
        {
            self.library = library
        }
        else
        {
            BoomicManager.createReadMe()
            library.songs = BoomicManager.scanForSongs()
        }
        
        mapLibrary()
    }
    
    /// Connect songs, albums, artists, by reference to allow them to be easilty navigated between
    // TODO: Hashing
    func mapLibrary()
    {
        for song in library.songs
        {
            if let artistName = song.artistName
            {
                if let artist = library.artists.first(where: {$0.name == artistName})
                {
                    artist.addSong(song)
                }
                else
                {
                    let artist = Artist(name: artistName)
                    artist.addSong(song)
                    library.artists.append(artist)
                }
            }
            
            if let albumTitle = song.albumTitle
            {
                if let album = library.albums.first(where: {$0.title == albumTitle})
                {
                    album.addSong(song)
                }
                else
                {
                    let album = Album(title: albumTitle)
                    album.addSong(song)
                    library.albums.append(album)
                }
            }
        }
    }
}

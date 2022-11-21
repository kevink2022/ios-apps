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
    // MARK: Model Objects
    var songs : [Song] = []
    var artists : [Artist] = []
    var albums : [Album] = []
    
    // MARK: Audio Engine Objects
    @Published var player : AVPlayer
    var commandCenter : MPRemoteCommandCenter
    
    // MARK: Playback State
    @Published var queue : [Song] = []
    @Published var currentSongIndex : Int? = nil
    @Published var shuffleState : Shuffle = .inOrder
    @Published var repeatState : Repeat = .dontRepeat
    
    // MARK: View State
    @Published var showCurrentSongSheet : Bool = false
    @Published var showQueueSheet : Bool = false

    init()
    {
        let _ = BoomicManager.initAudioSession()
        
        player = AVPlayer()
        
        commandCenter = MPRemoteCommandCenter.shared()
            
        // MARK: configuring command center
        commandCenter.togglePlayPauseCommand.addTarget
        {
            [unowned self] event in
            
            if let _ = self.currentSong
            {
                if self.isPlaying
                {
                    self.player.pause()
                }
                else
                {
                    self.player.play()
                }
            }
            
            return .success
        }
        
        // MARK: Scanning files to create library
        for format in BoomicLibrary.SupportedFileFormats.allCases
        {
            if let URLs = Bundle.main.urls(forResourcesWithExtension: format.rawValue, subdirectory: nil)
            {
                songs.append(contentsOf: URLs.map
                {
                    if let tags = getTags(source: $0, format: format)
                    {
                        return Song(source: $0, tags: tags)
                    }
                    else
                    {
                        return Song(source: $0)
                    }
                })
            }
        }
        
        // MARK: Build Song/Album/Artist/Composer/etc. map
        for song in songs
        {
            if let artistName = song.artistName
            {
                if let artist = artists.first(where: {$0.name == artistName})
                {
                    artist.addSong(song)
                }
                else
                {
                    let artist = Artist(name: artistName)
                    artist.addSong(song)
                    artists.append(artist)
                }
            }
            
            if let albumTitle = song.albumTitle
            {
                if let album = albums.first(where: {$0.title == albumTitle})
                {
                    album.addSong(song)
                }
                else
                {
                    let album = Album(title: albumTitle)
                    album.addSong(song)
                    albums.append(album)
                }
            }
        }
    }
}

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
    static let DEBUG : Bool = true
    
    var songs : [Song] = []
    @Published var queue : [Song] = []
    var artists : [Artist] = []
    var albums : [Album] = []
    @Published var currentSongIndex : Int? = nil
    
    @Published var player : AVPlayer
    var commandCenter : MPRemoteCommandCenter
    
    // MARK: Playback States
    @Published var shuffleState : Shuffle = .inOrder
    @Published var repeatState : Repeat = .dontRepeat
    
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
                print("pause/play")
                
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
            
            print(song.titleLabel)
            print(song.albumLabel)
            print(song.artistLabel)
        }
        
        print("end init")
    }
}

/// 0x0000600001366f80 - classics
/// 0x0000600001b45ea0 - lound pipes

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
    
    @Published var songs : [Song] = []
    var currentSong : Song? = nil
    var player : AVPlayer
    
    var commandCenter : MPRemoteCommandCenter
    
    
    
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
    }
}


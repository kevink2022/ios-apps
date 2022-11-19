//
//  MediaControls.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/4/22.
//

import Foundation
import AVFoundation

extension BoomicManager
{
    var isPlaying : Bool { player.rate != 0 }
    
    var currentSong : Song?
    {
        if let index = self.currentSongIndex {
            return queue[index]
        } else {
            return nil
        }
    }
    
    var songProgress : Double
    {
        get
        {
            let curr = player.currentTime()
            
            if let dur = player.currentItem?.duration
            {
                return CMTimeGetSeconds(curr) / CMTimeGetSeconds(dur)
            }
            else { return 0 }
        }
        set
        {
            if let dur = player.currentItem?.duration
            {
                let seekTo = CMTime(seconds: newValue * CMTimeGetSeconds(dur), preferredTimescale: 1)
                player.seek(to: seekTo)
            }
        }
    }
    
    // MARK: - Media Controls
    func togglePlayback() { isPlaying ? pause() : play() }
    func play() { player.play(); objectWillChange.send() }
    func pause() { player.pause(); objectWillChange.send() }
    
    func nextSong()
    {
        if let curr = self.currentSongIndex
        {
            let playing = isPlaying
            
            if curr + 1 == self.queue.count
            {
                self.currentSongIndex = 0
                
                if repeatState == .repeatQueue { self.startNewSong(paused: false) }
                else { self.startNewSong(paused: true) }
            }
            else
            {
                self.currentSongIndex = curr + 1
                self.startNewSong(paused: !playing)
            }
        }
    }
    
    func lastSong()
    {
        if let curr = self.currentSongIndex
        {
            let playing = isPlaying
            
            if curr == 0
            {
                
            }
            else
            {
                self.currentSongIndex = curr - 1
                self.startNewSong(paused: !playing)
            }
        }
    }
    
    func toggleShuffle()
    {
        switch shuffleState
        {
        case .inOrder : shuffleState = .shuffle
        case .shuffle : shuffleState = .inOrder
        }
    }
    
    func toggleRepeat()
    {
        switch repeatState
        {
        case .dontRepeat : repeatState = .repeatQueue
        case .repeatQueue: repeatState = .repeatSong
        case .repeatSong : repeatState = .singleSong
        case .singleSong : repeatState = .dontRepeat
        }
    }
    
    
    
    func selectSong(queue: [Song], queueIndex: Int)
    {
        self.queue = queue
        if shuffleState == .shuffle
        {
            let song = self.queue.remove(at: queueIndex)
            self.queue = [song] + self.queue.shuffled()
            self.currentSongIndex = 0
        }
        else { self.currentSongIndex = queueIndex }
        
        self.startNewSong()
    }
    
    /// Create the player instance and prepare system for playback
    func startNewSong(paused: Bool = false)
    {
        if let song = currentSong
        {
            self.player = AVPlayer(url: song.source)
            //self.setupNowPlaying()
            self.addPeriodicTimeObserver()
            //self.player.seek(to: CMTime(seconds: 0.0, preferredTimescale: 1))
            if !paused { self.player.play() }
            //objectWillChange.send()
        }
    }
    
    /// Source: https://developer.apple.com/documentation/avfoundation/media_playback/observing_the_playback_time
    func addPeriodicTimeObserver()
    {
        // Notify every half second
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.5, preferredTimescale: timeScale)

        player.addPeriodicTimeObserver(forInterval: time, queue: .main)
        {
            [weak self] time in
            // update player transport UI
            self!.objectWillChange.send()
        }
    }
    
    // MARK: Playback States Definitions
    enum Shuffle
    {
        case inOrder, shuffle
    }
    
    enum Repeat
    {
        case dontRepeat     // Pause music at the end of the queue
        case repeatQueue    // Loop back to beginning of queue
        case repeatSong     // Play single song on repeat
        case singleSong     // Pause at the end of a song, returning to beginning of song
    }
}

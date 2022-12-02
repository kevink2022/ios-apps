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
    /// If a song's file is moved or deleted, then promt user and don't allow playback
    var songExists : Bool { player.currentItem != nil }
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
                let progress = CMTimeGetSeconds(curr) / CMTimeGetSeconds(dur)
                if progress >= 1 { onSongEnd() }
                return progress
            }
            else { return 0 }
        }
        set
        {
            if let dur = player.currentItem?.duration
            {
                let seekTo = CMTime(seconds: newValue * CMTimeGetSeconds(dur), preferredTimescale: CMTimeScale(NSEC_PER_SEC))
                player.seek(to: seekTo)
            }
        }
    }
    
    var volume : Double
    {
        get { Double(player.volume) }
        set { player.volume = Float(newValue) }
    }
    
    func onSongEnd()
    {
        if repeatState == .singleSong || repeatState == .repeatSong
        {
            startNewSong(paused: repeatState == .singleSong ? true : false)
        }
        else if currentSongIndex! + 1 == queue.count
        {
            currentSongIndex! = 0
            startNewSong(paused: repeatState == .dontRepeat ? true : false)
        }
        else
        {
            currentSongIndex! += 1
            startNewSong()
        }
    }
    
    // MARK: - Media Controls
    func togglePlayback() { isPlaying ? pause() : play() }
    func play() { player.play(); objectWillChange.send() }
    func pause() { player.pause(); objectWillChange.send() }
    
    func nextSong()
    {
        if currentSongIndex! + 1 == queue.count
        {
            currentSongIndex! = 0
        }
        else
        {
            currentSongIndex! += 1
        }
        startNewSong(paused: !isPlaying)
    }
    
    func lastSong()
    {
        // TODO: Implement restarting song
        if currentSongIndex! == 0
        {
            
        }
        else
        {
            currentSongIndex! -= 1
        }
        startNewSong(paused: !isPlaying)
    }
    
    func toggleShuffle()
    {
        switch shuffleState
        {
        case .inOrder : shuffleState = .shuffle; shuffleQueue()
        case .shuffle : shuffleState = .inOrder; unshuffleQueue()
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
    
    func queueSelectSong(index: Int)
    {
        currentSongIndex = index
        startNewSong(paused: !isPlaying)
    }
    
    func selectSong(queue newQueue: [Song], queueIndex: Int)
    {
        inlineQueue = newQueue
        
        queue = inlineQueue
        currentSongIndex = queueIndex
        
        if shuffleState == .shuffle { shuffleQueue() }
        startNewSong()
    }
    
    
    func shuffleQueue()
    {
        if let index = currentSongIndex
        {
            var oldQueue = inlineQueue
            let song = oldQueue.remove(at: index)
            let newQueue = [song] + oldQueue.shuffled()
            queue = newQueue
            currentSongIndex = 0
        }
    }
    
    func unshuffleQueue()
    {
        if let _ = currentSongIndex
        {
            let inlineIndex = inlineQueue.firstIndex(where: {$0.id == currentSong!.id})
    
            queue = inlineQueue
            currentSongIndex = inlineIndex
        }
    }
    
    /// Create the player instance and prepare system for playback
    func startNewSong(paused: Bool = false)
    {
        if let song = currentSong
        {
            player.replaceCurrentItem(with: AVPlayerItem(url: song.source))
            setupNowPlaying()
            addPeriodicTimeObserver()
            songProgress = 0.0
            if !paused { play() }
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

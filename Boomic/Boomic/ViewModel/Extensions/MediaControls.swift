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
    // MARK: - Media Controls
    func play() { player.play(); objectWillChange.send() }
    func pause() { player.pause(); objectWillChange.send() }
    //func seek(to time: Double) { player. }
    var isPlaying : Bool { player.rate != 0 }
    
    func setSong(song: Song)
    {
        self.currentSong = song
        self.player = AVPlayer(url: song.source)
        self.setupNowPlaying()
        self.addPeriodicTimeObserver()
        self.player.play()
    }
    
    /// Source: https://developer.apple.com/documentation/avfoundation/media_playback/observing_the_playback_time
    func addPeriodicTimeObserver() {
        // Notify every half second
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.5, preferredTimescale: timeScale)


        player.addPeriodicTimeObserver(forInterval: time, queue: .main) {
            [weak self] time in
            // update player transport UI
            self!.objectWillChange.send()
        }
    }
}

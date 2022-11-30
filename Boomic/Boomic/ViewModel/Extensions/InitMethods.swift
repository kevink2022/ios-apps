//
//  InitMethods.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/4/22.
//

import Foundation
import AVFoundation
import MediaPlayer

extension BoomicManager
{
    // MARK: - inits
    static func initAudioSession() -> Bool
    {
        let audioSession = AVAudioSession.sharedInstance()
        
        do
        {
            try audioSession.setCategory(.playback)
            try audioSession.setActive(true)
        }
        catch
        {
            print("ERROR: Audio Session error")
            return false
        }
        return true
    }
    
    func initCommandCenter() -> Bool
    {
        commandCenter.togglePlayPauseCommand.addTarget
        {
            [unowned self] event in
            
            if let _ = currentSong { togglePlayback() }
            return .success
        }
        
        commandCenter.nextTrackCommand.addTarget
        {
            [unowned self] event in
            
            if let _ = currentSong { nextSong() }
            return .success
        }
        
        commandCenter.previousTrackCommand.addTarget
        {
            [unowned self] event in
            
            if let _ = currentSong { lastSong() }
            return .success
        }
        
        
        
        // Source: https://stackoverflow.com/questions/34321071/how-can-i-make-the-control-center-slider-editable
        commandCenter.changePlaybackPositionCommand.addTarget
        {
            [unowned self] event in
                  
            if let _ = currentSong
            {
                guard let event = event as? MPChangePlaybackPositionCommandEvent else { return .commandFailed }
                
                print(event.positionTime)
                
                player.seek(to: CMTime(seconds: event.positionTime, preferredTimescale: CMTimeScale(NSEC_PER_SEC)))
            }
            return .success
        }
        
        
        return true
    }
}

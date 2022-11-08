//
//  StaticMethods.swift
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
    
    
    
}

//
//  BoomicManager.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/2/22.
//

import Foundation
import AVFoundation
import AudioToolbox

class BoomicManager : ObservableObject
{
    static let DEBUG : Bool = true
    
    @Published var songs : [Song] = []
    var currentSong : Song? = nil
    var player : AVAudioPlayer
    
    init()
    {
        let _ = BoomicManager.initAudioSession()
        
        player = AVAudioPlayer()
        
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
    
    func setSong(song: Song)
    {
        self.currentSong = song
        
        do
        {
            self.player = try AVAudioPlayer(contentsOf: song.source)
            self.player.prepareToPlay()
            self.player.play()
        }
        catch
        {
            print("ERROR: could not instantiate player")
        }
    }

}



extension BoomicManager
{
    // MARK: - Media Controls
    func play() { player.play(); objectWillChange.send() }
    func pause() { player.pause(); objectWillChange.send() }
    var isPlaying : Bool { player.isPlaying }
    
    // MARK: - Static Methods
    static func initAudioSession() -> Bool
    {
        let audioSession = AVAudioSession.sharedInstance()
        
        do
        {
            try audioSession.setCategory(.playback)
        }
        catch
        {
            print("Failed to set category")
            return false
        }
        
        do
        {
            try audioSession.setActive(true)
        }
        catch
        {
            print("Failed to set active")
            return false
        }
        
        return true
    }
}


// MARK: - Audio Toolbox
extension BoomicManager
{
    ///source:  https://stackoverflow.com/questions/52276830/how-can-i-get-flac-file-metadata-in-swift-on-ios-11
    func getTags(source: URL, format: BoomicLibrary.SupportedFileFormats) -> Dictionary<String,Any>?
    {
        var fileID: AudioFileID? = nil
        var status:OSStatus = AudioFileOpenURL(source as CFURL, .readPermission, BoomicLibrary.supportedFormatID(format: format), &fileID)

        guard status == noErr else { return nil }

        var dict: CFDictionary? = nil
        var dataSize = UInt32(MemoryLayout<CFDictionary?>.size(ofValue: dict))

        guard let audioFile = fileID else { return nil }

        status = AudioFileGetProperty(audioFile, kAudioFilePropertyInfoDictionary, &dataSize, &dict)

        guard status == noErr else { return nil }

        AudioFileClose(audioFile)

        guard let cfDict = dict else { return nil }

        let tagsDict = NSDictionary.init(dictionary: cfDict)
        
        let swiftDict = tagsDict as! Dictionary<String,Any>

        return swiftDict
    }
}

extension BoomicLibrary
{
    static func supportedFormatID(format: BoomicLibrary.SupportedFileFormats) -> AudioFileTypeID
    {
        switch format
        {
        case .flac: return kAudioFileFLACType
        case .m4a:  return kAudioFileM4AType
        }
    }
    
}



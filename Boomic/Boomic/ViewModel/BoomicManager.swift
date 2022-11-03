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
    @Published var songs : [Song] = []
    var currentSong : Song? = nil
    var player : AVAudioPlayer
    
    init()
    {
        let _ = BoomicManager.initAudioSession()
        
        player = AVAudioPlayer()
        
        
        // on inital boot, probably will extract to scan lib func
        if let flacURLs = Bundle.main.urls(forResourcesWithExtension: "flac", subdirectory: nil)
        {
            songs = flacURLs.map
            {
                if let tags = audioFileInfo(url: $0)
                {
                    return Song(source: $0, tags: tags)
                }
                else
                {
                    return Song(source: $0)
                }

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
    
    func getMetadata()
    {
        for song in songs
        {
            let _ = audioFileInfo(url: song.source)
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
    func audioFileInfo(url: URL) -> Dictionary<String,Any>?
    {
        var fileID: AudioFileID? = nil
        var status:OSStatus = AudioFileOpenURL(url as CFURL, .readPermission, kAudioFileFLACType, &fileID)

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

//class BoomicMetadata
//{
//    var url : URL
//
//    init(url: URL)
//    {
//        self.url = url
//
//        let playerItem = AVPlayerItem(url: url)
//
//        let asset: AVAsset = playerItem.asset// An asset object to inspect.
//
//        BoomicMetadata.getMetadata(asset: asset)
//
//        playerItem.asset.loadMetadata(for: .unknown)
//        {
//            metadata, error in
//
//            guard error == nil else {print("ERROR: \(error?.localizedDescription)"); return}
//
//            print(metadata?.count)
//            metadata?.forEach {print("METADATA: \($0)")}
//        }
//    }
//
//    static func getMetadata(asset: AVAsset) async throws
//    {
//        for format in try await asset.load(.availableMetadataFormats) {
//            let metadata = try await asset.loadMetadata(for: format)
//            // Process the format-specific metadata collection.
//        }
//    }
//}

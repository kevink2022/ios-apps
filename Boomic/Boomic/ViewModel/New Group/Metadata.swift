//
//  Metadata.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/4/22.
//

import Foundation
import AVFoundation
import AudioToolbox
import MediaPlayer

extension BoomicManager
{
    ///source:  https://stackoverflow.com/questions/52276830/how-can-i-get-flac-file-metadata-in-swift-on-ios-11
    ///  The comments were added by the openai chatbot!
    // A function that gets the metadata tags from an audio file
    static func getTags(source: URL, format: BoomicLibrary.SupportedFileFormats) -> Dictionary<String,Any>? {
        // Open the audio file with the specified URL and format
        var fileID: AudioFileID? = nil
        var status:OSStatus = AudioFileOpenURL(source as CFURL, .readPermission, BoomicLibrary.supportedFormatID(format: format), &fileID)

        // Check if the file was successfully opened
        guard status == noErr else { return nil }

        // Get the metadata tags from the audio file
        var dict: CFDictionary? = nil
        var dataSize = UInt32(MemoryLayout<CFDictionary?>.size(ofValue: dict))

        // Check if the audio file ID is valid
        guard let audioFile = fileID else { return nil }

        // Get the metadata tags from the audio file
        status = AudioFileGetProperty(audioFile, kAudioFilePropertyInfoDictionary, &dataSize, &dict)

        // Check if the metadata was successfully retrieved
        guard status == noErr else { return nil }

        // Close the audio file
        AudioFileClose(audioFile)

        // Check if the metadata dictionary is valid
        guard let cfDict = dict else { return nil }

        // Convert the metadata dictionary to a dictionary that can be used in Swift
        let tagsDict = NSDictionary.init(dictionary: cfDict)
        let swiftDict = tagsDict as! Dictionary<String,Any>

        // Return the metadata dictionary
        return swiftDict
    }
    
    /// Only does album art right now, more modern framework for getting tags,
    /// probably should use this for all tags but don't feel like dealing with the
    /// async in init rn
    // TODO: Embedded or stored get priority?
    /// EMBEDDED
    ///   + Easier for user to manage library
    ///   - Very heavy on RAM
    /// STORED PROS
    ///   + Very light on RAM
    ///   - Can incorrectly match if library is unorganized
    /// Currently, stored is first, but this could be easilty reversed
    func getAlbumArtwork() async
    {
        for song in library.songs
        {
            /// Putting the album cover in the same directory has the files is common practice
            let songDirectory = song.source.deletingLastPathComponent()
            
            if songDirectory.hasDirectoryPath
            {
                
                // TODO: Clean this
                /// Lowercase
                for format in BoomicLibrary.SupportedAlbumArtFormats.allCases
                {
                    if let artwork_url = Bundle.urls(forResourcesWithExtension: format.rawValue, subdirectory: nil, in: songDirectory)?.first
                    {
                        song.albumCover = .url(artwork_url.absoluteURL)
                        break
                    }
                }
                /// Uppercase
                for format in BoomicLibrary.SupportedAlbumArtFormats.allCases
                {
                    if let artwork_url = Bundle.urls(forResourcesWithExtension: format.rawValue.uppercased(), subdirectory: nil, in: songDirectory)?.first
                    {
                        song.albumCover = .url(artwork_url.absoluteURL)
                        break
                    }
                }
            }
                
            if let _ = song.albumCover { continue }
            
            let asset: AVAsset = AVAsset(url: song.source) // An asset object to inspect.
            
            do
            {
                for format in try await asset.load(.availableMetadataFormats) {
                    let metadata = try await asset.loadMetadata(for: format)
                    // Process the format-specific metadata collection.
                    
                    let artworkItem = AVMetadataItem.metadataItems(
                        from: metadata,
                        filteredByIdentifier: .iTunesMetadataCoverArt
                    )
                    
                    if let artwork = artworkItem.first
                    {
                        if let imageData = try await artwork.load(.dataValue)
                        {
                            song.albumCover = .data(imageData)
                        }
                    }
                }
            }
            catch
            {
                //TODO: Error handling
            }
        }
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

extension BoomicManager
{
    /// source : https://developer.apple.com/documentation/avfoundation/media_playback/creating_a_basic_video_player_ios_and_tvos/controlling_background_audio
    func setupNowPlaying()
    {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        
        if let song = currentSong
        {
            nowPlayingInfo[MPMediaItemPropertyTitle] = song.titleLabel
            nowPlayingInfo[MPMediaItemPropertyArtist] = song.artistLabel
            
            nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = player.currentItem!.duration.seconds
            
            nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = String(player.currentTime().seconds)
            nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = player.rate
            
            nowPlayingInfo[MPNowPlayingInfoPropertyAssetURL] = song.source
            
            nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackProgress] = songProgress
        }

        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}

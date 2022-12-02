//
//  FileManagement.swift
//  Boomic
//
//  Created by Kevin Kelly on 12/1/22.
//

import Foundation

extension BoomicManager
{
    static func scanForSongs() -> [Song]
    {
        var songs : [Song] = []
        
        var URLs : [URL] = []
        
        let docsBundle = Bundle(url: URL.documentsDirectory)
        
        let fileManager = FileManager()
        
        // Enumerate the app's document directory
        if let enumerator = fileManager.enumerator(atPath: URL.documentsDirectory.path())
        {
            for object in enumerator.allObjects
            {
                if let object = object as? String
                {
                    URLs.append(URL.documentsDirectory.appending(component: object))
                }
            }
        }
        
        for url in URLs
        {
            if let format = BoomicLibrary.SupportedFileFormats.allCases.first(where: {$0.rawValue == url.pathExtension})
            {
                if let tags = BoomicManager.getTags(source: url, format: format)
                {
                    songs.append(Song(source: url, tags: tags))
                }
                else
                {
                    songs.append(Song(source: url))
                }
            }
        }
        
//        for format in BoomicLibrary.SupportedFileFormats.allCases
//        {
//            //if let URLs = Bundle.main.urls(forResourcesWithExtension: format.rawValue, subdirectory: nil)
//            if let URLs = Bundle.urls(
//                forResourcesWithExtension: format.rawValue,
//                subdirectory: nil,
//                in: URL.documentsDirectory
//            ) {
//                songs.append(contentsOf: URLs.map
//                {
//                    if let tags = BoomicManager.getTags(source: $0, format: format)
//                    {
//                        return Song(source: $0, tags: tags)
//                    }
//                    else
//                    {
//                        return Song(source: $0)
//                    }
//                })
//            }
//        }
        
        return songs
    }
    
    
    /// Readme is probably not necessary, but I cannot figure out a better way to
    /// create the App directory for users to put their music into.
    static func createReadMe()
    {
        let file = "README.txt"
        let contents = "Place Music in this folder for it to be reconized by Boomic Music."
        
        let dir = URL.documentsDirectory
        let fileURL = dir.appending(component: file)
        
        do
        {
            try contents.write(to: fileURL, atomically: false, encoding: .utf8)
        }
        catch { }
    }
}

extension URL
{
//    var fileType : String
//    {
//
//    }
}

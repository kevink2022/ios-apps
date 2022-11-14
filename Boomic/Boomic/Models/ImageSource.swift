//
//  ImageSource.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/14/22.
//

import Foundation

/// Views with images being passed to them will use image source to determine how to process the image
enum ImageSource
{
    case systemName(String)
    case asset(String)
    case url(URL)
}

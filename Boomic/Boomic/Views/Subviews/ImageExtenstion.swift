//
//  ImageExtenstion.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/14/22.
//

import SwiftUI

extension Image
{
    init(_ source : ImageSource)
    {
        switch source
        {
        case .systemName(let image):
            self.init(systemName: image)
        case .asset(let image):
            self.init(image)
            
        // TODO: Add URL support
        case .url:
            self.init("exclamationmark.triangle.fill")
        }
    }
}

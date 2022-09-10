//
//  Pentagon.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/9/22.
//

import Foundation
import SwiftUI

struct Pentagon : Shape
{
    
    
    func path(in rect: CGRect) -> Path
    {
        var path = Path()
        // 18 Degrees is the outer angle of a pentagon
        let offset = rect.midX*tan(<#T##x: CGFloat##CGFloat#>)
            
        // Top of the Pentagon
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: offset))
        path.addLine(to: CGPoint(x: rect.maxX - offset, y: rect.maxY))
        path.addLine(to: CGPoint(x: offset, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: offset))
        
        return path
    }
}

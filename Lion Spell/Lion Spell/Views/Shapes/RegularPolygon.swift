//
//  RegularPolygon.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/10/22.
//

import Foundation
import SwiftUI

struct RegularPolygon : Shape
{
    let sides : Int
    
    func path(in rect: CGRect) -> Path
    {
        let radius = min(rect.width, rect.height)/2
        let angle = (2.0*Double.pi/Double(sides))
        let centerX = rect.width/2
        let centerY = rect.height/2
        
        var path = Path()
        path.move(to: CGPoint(x: centerX + radius, y: centerX))
        
        for side in 1..<sides
        {
            let x = centerX + CGFloat(cos( Double(side) * angle) * radius)
            let y = centerY + CGFloat(sin( Double(side) * angle) * radius)
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return path
    }
}

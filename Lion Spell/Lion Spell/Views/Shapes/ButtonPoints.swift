//
//  ButtonPoints.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/12/22.
//

import Foundation
import SwiftUI

struct ButtonPoint : Identifiable
{
    let point : CGPoint
    let index : Int
    let rotation : Angle
    let id = UUID()
}

extension ButtonPoint
{
    static func getPoints(buttons: Int, frame: CGRect) -> Array<ButtonPoint>
    {
        let radius = min(frame.width, frame.height)/(buttons < 6 ? 2 : 3)
        let angle = (2.0*Double.pi/Double(buttons-1))
        let centerX = frame.width/2
        let centerY = frame.height/2
        
        var points : Array<ButtonPoint> = []
        
        points.append(ButtonPoint(point: CGPoint(x: centerX, y: centerX), index: 0, rotation: Angle(radians: 0)))
            
        for side in 1..<buttons
        {
            let x = centerX + CGFloat(cos( Double(side) * angle) * radius)
            let y = centerY + CGFloat(sin( Double(side) * angle) * radius)
            
            points.append(ButtonPoint(point: CGPoint(x: x, y: y), index: side, rotation: Angle(radians: Double(side) * angle)))
        }
        
        return points
    }
}


//
//  Diamond.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/9/22.
//

import Foundation
import SwiftUI

struct Diamond : Shape
{
    func path(in rect: CGRect) -> Path
    {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
        return path
    }
}

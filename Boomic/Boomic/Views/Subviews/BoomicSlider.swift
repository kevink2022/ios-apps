//
//  BoomicSlider.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/7/22.
//

import SwiftUI

struct BoomicSlider: View
{
    var body: some View
    {
        GeometryReader
        {
            geo in __BoomicSlider(geometry: geo)
        }
    }
}

struct __BoomicSlider: View
{
    @State var percent : Double = 0.5
    @State var offset : Double = 0.0
    let geometry : GeometryProxy
    
    var body: some View
    {
        let drag = DragGesture()
            .onChanged {
                value in
                offset = (value.translation.width / geometry.size.width)
            }
            .onEnded {
                value in
                
                offset = 0.0
                percent += (value.translation.width / geometry.size.width)

                // seek or volume or whatever
            }

        ZStack(alignment: .leading)
        {
            Rectangle()
                .foregroundColor(.gray)
            
            Rectangle()
                .frame(width: geometry.size.width * (percent + offset))
        }
        .clipShape(Capsule())
        .gesture(drag)
        .frame(height: C.frame)
    }
    
    typealias C = ViewConstants.Subviews.BoomicSlider
}

struct BoomicSlider_Previews: PreviewProvider
{
    static var previews: some View
    {
        BoomicSlider()
    }
}

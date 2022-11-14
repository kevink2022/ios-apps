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
                let _offset = (value.translation.width / geometry.size.width)
                if ((percent + _offset) > 1) {offset = 1-percent}
                else {offset = _offset}
            }
            .onEnded {
                value in
                
                offset = 0.0
                percent += (value.translation.width / geometry.size.width)
                if (percent > 1) {percent = 1}


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

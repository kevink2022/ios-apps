//
//  BoomicSlider.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/7/22.
//

import SwiftUI

struct BoomicSlider: View
{
    @Binding var percent : Double
    
    var body: some View
    {
        GeometryReader
        {
            geo in __Slider(
                percent: $percent,
                geometry: geo
            )
        }
    }
    
    private struct __Slider : View
    {
        @Binding var percent : Double
        @State var offset : Double = 0.0
        let geometry : GeometryProxy
        
        var body: some View
        {
            let drag = DragGesture()
                .onChanged {
                    value in
                    let _offset = (value.translation.width / geometry.size.width)
                    if ((percent + _offset) > 1) {offset = 1-percent}
                    else if ((percent + _offset) < 0) {offset = -percent}
                    else {offset = _offset}
                }
                .onEnded {
                    value in
                    
                    offset = 0.0
                    percent += (value.translation.width / geometry.size.width)
                    if (percent > 1) {percent = 1}
                    else if (percent < 0) {percent = 0}

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
}

//struct BoomicSlider_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        BoomicSlider()
//    }
//}

//
//  GestureVolumeSlider.swift
//  Boomic
//
//  Created by Kevin Kelly on 12/8/22.
//

import SwiftUI

struct GestureVolumeSlider: View
{
    @State var volume = 0.5
    
    var body: some View
    {
        BoomicSlider(percent: $volume, shape: RightTriangle(), vertical: true)
            .frame(width: 100, height: 100)
    }
}

struct GestureVolumeSlider_Previews: PreviewProvider {
    static var previews: some View {
        GestureVolumeSlider()
    }
}

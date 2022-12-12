//
//  GestureVolumeSlider.swift
//  Boomic
//
//  Created by Kevin Kelly on 12/8/22.
//

import SwiftUI

struct GestureVolumeSlider: View
{
    @EnvironmentObject var manager : BoomicManager
    
    var body: some View
    {
        ZStack
        {
            BoomicSlider(
                percent: $manager.volume,
                shape: RightTriangle(),
                vertical: true,
                constantUpdates: true)
        }
    }
}

//struct GestureVolumeSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        GestureVolumeSlider()
//    }
//}

//
//  Gesture_GUI.swift
//  Boomic
//
//  Created by Kevin Kelly on 12/7/22.
//

import SwiftUI

struct Gesture_GUI: View
{
    var body: some View
    {
        ZStack
        {
            VStack
            {
                //GesturedAlbumCover()
                AlbumCover(image: nil)
                
                ZStack
                {
                    HStack
                    {
                        RightTriangle()
                            .padding()
                        
                        GestureVolumeSlider()
                    }
                    
                    Image(systemName: "play.fill")
                }
            }
        }
    }
}

struct Gesture_GUI_Previews: PreviewProvider {
    static var previews: some View {
        Gesture_GUI()
    }
}

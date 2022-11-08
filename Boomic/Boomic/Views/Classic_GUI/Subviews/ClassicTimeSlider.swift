//
//  ClassicTimeSlider.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/4/22.
//

import SwiftUI

struct ClassicTimeSlider: View
{
    @State var value : CGFloat = 50
    @EnvironmentObject var manager : BoomicManager
    
    var body: some View
    {
        VStack(spacing: 0)
        {
            HStack
            {
//                Text("\(manager.player.currentTime().seconds.readable)")
//
//                Spacer()
//
//                Text("\(manager.player.currentItem!.duration.seconds.readable)")
                
                Text("0:00")
                
                Spacer()
                
                Text("5:40")
            }
            .font(F.time)
            
            BoomicSlider()
        }
        
    }
    
    typealias F = ViewConstants.Classic_GUI.Fonts
}

struct ClassicTimeSlider_Previews: PreviewProvider {
    static var previews: some View {
        ClassicTimeSlider()
            .environmentObject(BoomicManager())
    }
}


extension Double
{
    var readable : String
    {
        if self > 0
        {
            let h : Int = Int(self/3600)
            let m : Int = Int(self)%3600/60
            let s : Int = Int(self)%60
            
            if h > 0
            {
                return String(format: "%i:%02i:%02i", h, m, s)
            }
            else
            {
                return String(format: "%i:%02i", m, s)
            }
        }
        else{ return "0:00" }
    }
}


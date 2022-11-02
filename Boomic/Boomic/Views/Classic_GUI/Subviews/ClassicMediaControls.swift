//
//  ClassicMediaControls.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/2/22.
//

import SwiftUI

struct ClassicMediaControls: View
{
    var body: some View
    {
        HStack
        {
            Spacer()
            
            Button
            {
                
            }
            label:
            {
                Image(systemName: C.lastSongSF)
            }
            
            Spacer()
            
            Button
            {
                
            }
            label:
            {
                Image(systemName: C.playSF)
            }
            
            Spacer()
            
            Button
            {
                
            }
            label:
            {
                Image(systemName: C.nextSongSF)
            }
            
            Spacer()
        }
        .font(C.font)
        .foregroundColor(C.color)
    }
    
    typealias C = ViewConstants.Classic_GUI.Subviews.ClassicMediaControls
}

struct ClassicMediaControls_Previews: PreviewProvider {
    static var previews: some View {
        ClassicMediaControls()
    }
}

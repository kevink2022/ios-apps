//
//  ClassicQueueControls.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/7/22.
//

import SwiftUI

struct ClassicQueueControls: View
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
                Image(systemName: C.repeatSF)
            }
            
            Spacer()
            
            Button
            {
                
            }
            label:
            {
                Image(systemName: C.shuffleSF)
            }
                
            Spacer()
            
            Button
            {
                
            }
            label:
            {
                Image(systemName: C.queueSF)
            }
            
            Spacer()
        }
        .font(F.queueControls)
        .foregroundColor(.primary)
    }
    
    typealias C = ViewConstants.Classic_GUI.Subviews.ClassicQueueControls
    typealias F = ViewConstants.Classic_GUI.Fonts
}

struct ClassicQueueControls_Previews: PreviewProvider {
    static var previews: some View {
        ClassicQueueControls()
    }
}

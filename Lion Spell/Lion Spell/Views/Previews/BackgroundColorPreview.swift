//
//  BackgroundColorPreview.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/9/22.
//

import SwiftUI

struct BackgroundColorPreview: View
{
    let backgroundColor : Color
    let view : AnyView
    
    var body: some View
    {
        ZStack
        {
            backgroundColor
                .ignoresSafeArea()
            
            view
        }
    }
}

struct BackgroundColorPreview_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
    }
}

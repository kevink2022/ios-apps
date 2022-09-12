//
//  MenuButtonView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/28/22.
//

import SwiftUI

struct MenuButtonView: View
{
    @Binding var sheet : ShowingSheet?
    
    var body: some View
    {
        HStack
        {
            NewGameButton()
            
            Spacer()
            
            // Hints button
            Button(action: {sheet = .hints})
            {
                Image(systemName: "info.circle")
            }
            
            Spacer()
            
            // Prefrences Button
            Button(action: {sheet = .preferences})
            {
                Image(systemName: "gearshape")
            }
            
            // Note: These button views will likely be split into
            //       their own files into the future, but at the
            //       moment I feel it is not necessary.
        }
        .font(.title)
        .foregroundColor(.white)
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            //MenuButtonView()
        }
    }
}

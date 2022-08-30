//
//  MenuButtonView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/28/22.
//

import SwiftUI

struct MenuButtonView: View {
    var body: some View
    {
        HStack
        {
            // New Game button
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
            {
                Image(systemName: "plus.circle")
            }
            
            Spacer()
            
            // Hints button
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
            {
                Image(systemName: "info.circle")
            }
            
            Spacer()
            
            // Prefrences Button
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
            {
                Image(systemName: "gearshape")
            }
            
            // Note: These button views will likely be split into
            //       their own files into the future, but at the
            //       moment I feel it is not necessary.
        }
        .padding()
        .font(.title)
        .foregroundColor(.white)
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            MenuButtonView()
        }
    }
}

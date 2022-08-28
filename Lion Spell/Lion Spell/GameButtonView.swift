//
//  GameButtonView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/28/22.
//

import SwiftUI

struct GameButtonView: View {
    var body: some View {
        HStack
        {
            // Backspace button
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
            {
                Image(systemName: "delete.left")
            }
            
            Spacer()
            
            // Submit Button
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
            {
                Image(systemName: "paperplane")
            }
            
            // Note: These button views will likely be split into
            //       their own files into the future, but at the
            //       moment I feel it is not necessary.
        }
        .padding()
        .font(.title)
    }
}

struct GameButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GameButtonView()
    }
}

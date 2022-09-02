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
            BackspaceButton()
            
            Spacer()
            
            SubmitButton()
        }
        .padding()
    }
}

struct GameButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            GameButtonView()
        }
    }
}

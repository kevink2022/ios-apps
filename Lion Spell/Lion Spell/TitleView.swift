//
//  TitleView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/28/22.
//

import SwiftUI

struct TitleView: View {
    var body: some View
    {

        HStack
        {
            Image("lionsticker")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 175)
            

            VStack(alignment: .trailing)
            {
                Text("LION")
                Text("SPELL")
            }
            .padding(.leading, -30)
            .padding(.top, 50)
            .font(.custom("Chalkduster", size: 48))
            .foregroundColor(.white)

            
        }
        
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            TitleView()
        }
        
    }
}

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
                .frame(height: ViewConstants.lionStickerHeight)
            

            VStack(alignment: .trailing)
            {
                Text("LION")
                Text("SPELL")
            }
            .padding(.leading, ViewConstants.titleLeadingPadding)
            .padding(.top, ViewConstants.titleTopPadding)
            .font(.custom("Chalkduster", size: ViewConstants.largeChalkFontSize))
            .foregroundColor(.white)
        }
    }
}

extension ViewConstants {
    static let lionStickerHeight : CGFloat = 175
    static let titleLeadingPadding : CGFloat = -30
    static let titleTopPadding : CGFloat = 50
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

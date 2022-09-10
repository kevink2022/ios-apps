//
//  SimpleTitleView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 9/9/22.
//

import SwiftUI

struct SimpleTitleView: View {
    var body: some View {
        Text("LION SPELL")
            .font(.custom("Chalkduster", size: ViewConstants.largeChalkFontSize))
            .foregroundColor(.white)
    }
}

struct SimpleTitleView_Previews: PreviewProvider {
    static var previews: some View {
        // This was supposed to save time
        BackgroundColorPreview(backgroundColor: Color("psuBlue"), view: AnyView(SimpleTitleView()))
    }
}

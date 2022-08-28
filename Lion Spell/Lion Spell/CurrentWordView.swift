//
//  CurrentWordView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct CurrentWordView: View {
    let word: String
    
    var body: some View {
        Text(word)
            .font(.largeTitle)
    }
}

struct CurrentWordView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWordView(word: "lorem")
    }
}

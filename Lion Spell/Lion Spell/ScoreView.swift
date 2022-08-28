//
//  ScoreView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/28/22.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    var body: some View
    {
        Text("\(score)")
            .font(.largeTitle)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 15)
    }
}

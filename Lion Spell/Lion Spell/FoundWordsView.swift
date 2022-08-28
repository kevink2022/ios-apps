//
//  FoundWordsView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct FoundWordsView: View {
    let words: Array<String>
    
    var body: some View
    {
        ScrollView(.horizontal) {
            HStack
            {
                ForEach(words.indices)
                {
                    index in Text("\(words[index])")
                }
            }
            .padding()
        }
    }
}

struct FoundWordsView_Previews: PreviewProvider {
    static var previews: some View {
        FoundWordsView(words: ["Lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit","sed","do","eiusmod","tempor","incididunt","ut","labore","et","dolore","magna","aliqua"])
    }
}

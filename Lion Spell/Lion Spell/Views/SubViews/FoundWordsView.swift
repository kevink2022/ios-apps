//
//  FoundWordsView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct FoundWordsView: View {
    let words: Array<Word>
    
    var body: some View
    {
            ScrollView(.horizontal)
            {
                HStack
                {
                    if words.count == 0
                    {
                        Text(" ")
                    }
                    else
                    {
                        ForEach(words)
                        {
                            word in Text("\(word.string)")
                        }
                    }
                }
                .font(.custom("American Typewriter Semibold", size: ViewConstants.smallTypewriterFontSize))
                .padding()
                .foregroundColor(Color("psuBlue"))
            }
            .background(Color(.white))
    }
}

struct FoundWordsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            //FoundWordsView(words: ["Lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit","sed","do","eiusmod","tempor","incididunt","ut","labore","et","dolore","magna","aliqua"])
        }
        
    }
}

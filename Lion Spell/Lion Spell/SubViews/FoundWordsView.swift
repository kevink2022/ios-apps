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
                        ForEach(words.indices)
                        {
                            index in Text("\(words[index])")
                        }
                    }
                }
                .font(.custom("American Typewriter Semibold", size: 24))
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
            
            FoundWordsView(words: ["Lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit","sed","do","eiusmod","tempor","incididunt","ut","labore","et","dolore","magna","aliqua"])
        }
        
    }
}

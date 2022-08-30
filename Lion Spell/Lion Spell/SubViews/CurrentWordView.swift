//
//  CurrentWordView.swift
//  Lion Spell
//
//  Created by Kevin Kelly on 8/26/22.
//

import SwiftUI

struct CurrentWordView: View {
    let letters: Array<Character>
    
    var body: some View
    {
        HStack
        {
            ForEach(letters.indices)
            {
                index in
                    Text("\(String(letters[index]))")
                        .font(.custom("Chalkduster", size: 48))
                        .foregroundColor(.white)
            }
            
        }
    }}

struct CurrentWordView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("psuBlue")
                .ignoresSafeArea()
            
            CurrentWordView(letters: ["a", "b", "c", "d", "e"])
        }
        
    }
}

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
                index in Text("\(String(letters[index]))")
                            .font(.largeTitle)
            }
            
        }
    }}

struct CurrentWordView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWordView(letters: ["a", "b", "c", "d", "e"])
    }
}

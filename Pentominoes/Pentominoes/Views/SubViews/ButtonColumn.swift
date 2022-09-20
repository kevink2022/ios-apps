//
//  ButtonColumn.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct ButtonColumn: View
{
    let boardButtons : Array<String>
    
    var body: some View
    {
        VStack
        {
            ForEach(boardButtons, id: \.self)
            {
                board in
                
                BoardButton(boardTitle: board)
            }
        }
    }
}

struct ButtonColumn_Previews: PreviewProvider
{
    static var previews: some View
    {
        ButtonColumn(boardButtons: ["Board0", "Board1", "Board2"])
    }
}

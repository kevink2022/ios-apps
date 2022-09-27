//
//  ResetButton.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct ResetButton: View
{
    @EnvironmentObject var manager : PentominoManager
    
    var body: some View
    {
        Button
        {
            manager.reset()
        }
        label:
        {
            Text("Reset")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
    }
}

struct ResetButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
        //ResetButton()
    }
}

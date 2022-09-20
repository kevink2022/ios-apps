//
//  ResetButton.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct ResetButton: View {
    var body: some View {
        Button
        {
            
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
        ResetButton()
    }
}

//
//  ExitSheetButton.swift
//  Campus
//
//  Created by Kevin Kelly on 10/3/22.
//

import SwiftUI

struct ExitSheetButton: View
{
    @EnvironmentObject var manager : MapManager
    let text : String
    
    var body: some View
    {
        Button
        {
            manager.showSheet = false
            manager.sheet = .none
        }
        label:
        {
            Text(text)
        }
    }
}

struct ExitSheetButton_Previews: PreviewProvider {
    static var previews: some View {
        ExitSheetButton(text: "Exit")
            .environmentObject(MapManager())
    }
}

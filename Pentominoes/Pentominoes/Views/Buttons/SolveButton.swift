//
//  SolveButton.swift
//  Pentominoes
//
//  Created by Kevin Kelly on 9/19/22.
//

import SwiftUI

struct SolveButton: View
{
    @EnvironmentObject var manager : PentominoManager
    
    var body: some View
    {
        Button
        {
            manager.solve()
        }
        label:
        {
            Text("Solve")
                .font(.largeTitle)
                .foregroundColor(manager.boardNumber == 0 ? .gray : .red)
        }
        .disabled(manager.boardNumber == 0)
    }
}

struct SolveButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
        //SolveButton()
    }
}

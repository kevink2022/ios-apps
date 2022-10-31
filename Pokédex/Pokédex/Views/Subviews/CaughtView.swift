//
//  CaughtView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/28/22.
//

import SwiftUI

struct CaughtView: View
{
    typealias C = ViewConstants.Pokeball
    var caught : Bool
    
    var body: some View
    {
        (caught ? Image(C.caught) : Image(C.notCaught))
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}

struct CaughtButton: View
{
    @Binding var caught : Bool
    
    var body: some View
    {
        Button
        {
            caught.toggle()
        }
        label:
        {
            CaughtView(caught: caught)
        }
    }
}



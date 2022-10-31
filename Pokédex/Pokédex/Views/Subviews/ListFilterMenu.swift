//
//  ListFilterMenu.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/31/22.
//

import SwiftUI

struct ListFilterMenu: View
{
    @EnvironmentObject var manager : PokedexManager
    typealias C = ViewConstants.ListFilterMenu
    
    var body: some View
    {
        Menu
        {
            Button("All")
            {
                manager.filterType = nil
            }
            
            ForEach(PokemonType.allCases)
            {
                type in
                
                Button(type.rawValue)
                {
                    manager.filterType = type
                }
            }
        }
        label:
        {
            Image(systemName: C.icon)
        }
    }
}

struct ListFilterMenu_Previews: PreviewProvider {
    static var previews: some View {
        ListFilterMenu()
    }
}

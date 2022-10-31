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
    
    var body: some View
    {
        Menu
        {
            Button("Show All")
            {
                
            }
            
            Button("Show Caught")
            {
                
            }
            
            ForEach(PokemonType.allCases)
            {
                type in
                
                Button(type.rawValue)
                {
                    
                }
            }
        }
        label:
        {
            Image(systemName: "magnifyingglass.circle")
        }
    }
}

struct ListFilterMenu_Previews: PreviewProvider {
    static var previews: some View {
        ListFilterMenu()
    }
}

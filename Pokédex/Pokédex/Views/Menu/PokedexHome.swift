//
//  PokedexHome.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/28/22.
//

import SwiftUI

struct PokedexHome: View
{
    @EnvironmentObject var manager : PokedexManager
    typealias C = ViewConstants.PokedexHome
    
    var body: some View
    {
        NavigationStack
        {
            ScrollView
            {
                VStack
                {
                    if let caught = manager.filteredByCaught()
                    {
                        if !caught.isEmpty
                        {
                            CategoryView(
                                title: "Caught",
                                catchable: caught,
                                dismissOnRelease: true
                            )
                            
                            Divider()
                        }
                    }
                    
                    ForEach(PokemonType.allCases)
                    {
                        type in
                        
                        CategoryView(
                            title: type.rawValue,
                            catchable: manager.filteredByType(type),
                            dismissOnRelease: false
                        )
                        
                        Divider()
                    }
                }
            }
        }
    }
}

struct PokedexHome_Previews: PreviewProvider {
    static var previews: some View {
        PokedexHome()
    }
}

extension ViewConstants
{
    struct PokedexHome
    {
        static let rowPadding : CGFloat = 10
    }
}

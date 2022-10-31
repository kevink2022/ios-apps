//
//  ViewConstants.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct ViewConstants
{
    struct CategoryView
    {
        static let titleFont : Font = .system(.title, design: .rounded, weight: .bold)
        static let verticalPadding : CGFloat = 10
        static let horizontalPadding : CGFloat = 5
    }
    
    struct EvolutionsView
    {
        static let titleFont : Font = ViewConstants.PokemonDetailView.sectionTitleFont
        static let frame : CGFloat = 100
    }
    
    struct DetailToobar
    {
        static let titleFont : Font = .system(.largeTitle, design: .default, weight: .bold)
    }
    
    struct Pokeball
    {
        static let caught = "pokeball_color"
        static let notCaught = "pokeball_gray"
    }
    
    struct MainView
    {
        static let homeText  = "Home"
        static let homeImage = "house"
        static let listText  = "List"
        static let listImage = "list.bullet"
    }
    
    struct PokemonListView
    {
        static let listHeight : CGFloat = 100
        static let numberFont : Font = .system(.subheadline, design: .monospaced, weight: .regular)
        static let nameFont : Font = .system(.title3, design: .rounded, weight: .bold)
        static let textColor : Color = .primary
        
        struct Image
        {
            static let cornerRadius : CGFloat = 15
            static let interiorPadding : CGFloat = 10
        }
    }
    
    struct PokemonDetailView
    {
        static let sectionTitleFont : Font = .system(.body, design: .rounded, weight: .semibold)
        static let caughtButtonFrame : CGFloat = 40
        
        struct Image
        {
            static let cornerRadius : CGFloat = 25
            static let interiorPadding : CGFloat = 15
        }
    }
    
    struct PokemonImage
    {
        static let backgroundOpacity : CGFloat = 0.6
        static let numberFont : Font = .system(.title3, design: .monospaced, weight: .bold)
        static let pokeballOpacity : CGFloat = 0.5
        static let pokeballPadding : CGFloat = 2
    }
    
    struct TypeView
    {
        static let cornerRadius : CGFloat = 25
        static let textPadding : CGFloat = 10
        static let textColor : Color = .white
        static let textFont : Font = .system(.body, design: .rounded, weight: .bold)
    }
    
    struct StatisticView
    {
        static let valueFont : Font = .system(.largeTitle, design: .rounded, weight: .bold)
        static let titleFont : Font = .system(.title3, design: .rounded, weight: .bold)
        static let labelFont : Font = .system(.title3, design: .rounded, weight: .regular)
    }
}

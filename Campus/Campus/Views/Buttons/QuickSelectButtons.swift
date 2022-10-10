//
//  QuickSelectButtons.swift
//  Campus
//
//  Created by Kevin Kelly on 10/10/22.
//

import SwiftUI

struct QuickSelectButtons: View
{
    @EnvironmentObject var manager : MapManager
    
    var body: some View
    {
        
        // Show All
        Button
        {
            manager.showAll()
        }
        label:
        {
            HStack
            {
                HStack
                {
                    Text(ViewConstants.quickSelect.showAll.text)
                    
                    Spacer()
                    
                    Image(systemName: ViewConstants.quickSelect.showAll.image)
                }
            }
        }
        
        // Show Favorited
        Button
        {
            manager.showFavorites()
        }
        label:
        {
            HStack
            {
                Text(ViewConstants.quickSelect.showFavorites.text)
                
                Spacer()
                
                Image(systemName: ViewConstants.quickSelect.showFavorites.image)
            }
        }
        
        // Show Nearby
        Button
        {
            manager.showNearby()
        }
        label:
        {
            HStack
            {
                Text(ViewConstants.quickSelect.showNearby.text)
                
                Spacer()
                
                Image(systemName: ViewConstants.quickSelect.showNearby.image)
            }
        }
        
        // Show None
        Button
        {
            manager.showNone()
        }
        label:
        {
            HStack
            {
                Text(ViewConstants.quickSelect.showNone.text)
                
                Spacer()
                
                Image(systemName: ViewConstants.quickSelect.showNone.image)
            }
        }
        
    }
}

struct QuickSelectButtons_Previews: PreviewProvider
{
    static var previews: some View
    {
        QuickSelectButtons()
    }
}

extension ViewConstants
{
    struct quickSelect
    {
        struct showAll
        {
            static let text  = "Show all buildings"
            static let image = "building.2.fill"
        }
        
        struct showFavorites
        {
            static let text  = "Show all favorite buildings"
            static let image = "star.fill"
        }
        
        struct showNearby
        {
            static let text  = "Show all nearby buildings"
            static let image = "location.magnifyingglass"
        }
        
        struct showNone
        {
            static let text  = "Show no buildings"
            static let image = "x.circle.fill"
        }
    }
}

//
//  ToolbarButtons.swift
//  Campus
//
//  Created by Kevin Kelly on 10/3/22.
//

import SwiftUI

struct ToolbarButtons: View
{
    @EnvironmentObject var manager : MapManager
    
    var body: some View
    {
        // Favorites
        Button
        {
            if manager.presenting == .favorited
            {
                manager.presenting = .none
            }
            else
            {
                manager.presenting = .favorited
            }
            
        }
        label:
        {
            Image(systemName: manager.presenting == .favorited ? ViewConstants.favorite : ViewConstants.not_favorite)
                .foregroundColor(manager.presenting == .favorited ? ViewConstants.favorite_color : ViewConstants.not_color)
        }
        
        // Presented
        Button
        {
            if manager.presenting == .pinned
            {
                manager.presenting = .none
            }
            else
            {
                manager.presenting = .pinned
            }
        }
        label:
        {
            Image(systemName: manager.presenting == .pinned ? ViewConstants.building : ViewConstants.not_building)
                .foregroundColor(manager.presenting == .pinned ? ViewConstants.pinned_color : ViewConstants.not_color)
        }
        
        // Settings
        Button
        {
            manager.sheet       = .buildingMenu
            manager.presenting  = .pinned
            manager.showSheet   = true
        }
        label:
        {
            Image(systemName: ViewConstants.settings)
        }
    }
}

struct ToolbarButtons_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarButtons()
            .environmentObject(MapManager())
    }
}

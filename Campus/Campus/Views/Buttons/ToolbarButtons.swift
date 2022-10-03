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
            if manager.presenting == .presented
            {
                manager.presenting = .none
            }
            else
            {
                manager.presenting = .presented
            }
        }
        label:
        {
            Image(systemName: manager.presenting == .presented ? ViewConstants.presented : ViewConstants.not_presented)
                .foregroundColor(manager.presenting == .presented ? ViewConstants.presented_color : ViewConstants.not_color)
        }
        
        // Settings
        Button
        {
            manager.sheet       = .buildingMenu
            manager.presenting  = .presented
            manager.showSheet   = true
        }
        label:
        {
            Image(systemName: "gearshape")
        }
    }
}

struct ToolbarButtons_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarButtons()
            .environmentObject(MapManager())
    }
}

//
//  FavoriteButton.swift
//  Campus
//
//  Created by Kevin Kelly on 9/30/22.
//

import SwiftUI

struct FavoriteButton: View
{
    @EnvironmentObject var manager : MapManager
        
    var body: some View
    {
        Button
        {
            manager.toggleFavorite(building: manager.selectedBuilding)
        }
        label:
        {
            Image(systemName: manager.selectedBuilding.isFavorited ? ViewConstants.favorite : ViewConstants.not_favorite)
                .foregroundColor(manager.selectedBuilding.isFavorited ? ViewConstants.favorite_color : ViewConstants.not_color)
                .font(.title)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton()
            .environmentObject(MapManager())
    }
}

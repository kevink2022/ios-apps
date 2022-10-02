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
    
    let building : FavoritedBuilding
    
    var body: some View
    {
        Button
        {
            manager.toggleFavorite(building: building)
        }
        label:
        {
            Image(systemName: building.isFavorited ? "star.fill" : "star")
                .foregroundColor(building.isFavorited ? .yellow : .black)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(building: FavoritedBuilding.standard)
            .environmentObject(MapManager())
    }
}

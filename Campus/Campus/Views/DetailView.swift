//
//  DetailView.swift
//  Campus
//
//  Created by Kevin Kelly on 9/30/22.
//

import SwiftUI

struct DetailView: View
{
    let building : FavoritedBuilding
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text(building.building.name)
                    .font(.largeTitle)
                
                FavoriteButton(building: building)
            }
            
            if let photo = building.building.photo
            {
                Image(photo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DetailView(building: FavoritedBuilding.standard)
    }
}

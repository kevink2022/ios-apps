//
//  DetailView.swift
//  Campus
//
//  Created by Kevin Kelly on 9/30/22.
//

import SwiftUI

struct DetailView: View
{
    @EnvironmentObject var manager : MapManager
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text(manager.selectedBuilding.building.name)
                    .font(.largeTitle)
                
                Spacer()
                
                FavoriteButton()
            }
            
            if let photo = manager.selectedBuilding.building.photo
            {
                Image(photo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DetailView()
    }
}

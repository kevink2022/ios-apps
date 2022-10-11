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
    @State var showingDirections : Bool = false
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text(manager.selectedBuilding.building.name)
                    .font(.largeTitle)
                
                Spacer()
                
                Button
                {
                    manager.directions(to: manager.selectedBuilding)
                    withAnimation
                    {
                        showingDirections.toggle()
                    }
                }
                label:
                {
                    Image(systemName: ViewConstants.not_directions)
                        .foregroundColor(showingDirections ? ViewConstants.directions_color : ViewConstants.not_color)
                        .font(.title)
                }
                
                FavoriteButton()
            }
            
            if showingDirections
            {
                HStack
                {
                    Spacer()
                    VStack(alignment: .trailing)
                    {
                        Text("Time: \(manager.expectedTime) ")
                        Text("Direction: \(manager.headingAngle)˚")
                    }
                    .font(.title3)
                }
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

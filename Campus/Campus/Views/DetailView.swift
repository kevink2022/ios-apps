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
                    
                }
                label:
                {
                    Image(systemName: ViewConstants.walking)
                        .font(.title)
                }
                
                Button
                {
                    manager.getExpectedTime(to: manager.selectedBuilding)
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
                    
 
                    Text(manager.expectedTime)
                        .font(.title3)
                    
                    if manager.headingAngleToSelectedBuilding == -1
                    {
                        Image(systemName: "exclamationmark.triangle")
                    }
                    else
                    {
                        Image(systemName: "arrow.up")
                            .rotationEffect(Angle(degrees: manager.headingAngleToSelectedBuilding))
                    }
                    
                    Text(String(format: "%.2f˚", manager.headingAngleToSelectedBuilding < 0 ? manager.headingAngleToSelectedBuilding + 360 : manager.headingAngleToSelectedBuilding ))
                        .font(.title3)
                }
                .offset(x: -6)
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

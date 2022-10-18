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
                    manager.showSheet = false
                    manager.sheet = .none
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
                        .font(.title)
                }
                
                if manager.selectedBuilding.building.name != "Dropped Pin"
                {
                    FavoriteButton()
                }
                else
                {
                    Button
                    {
                        manager.showSheet = false
                        manager.sheet = .none
                        manager.removePin(pin: manager.selectedBuilding)
                        
                        
                    }
                    label:
                    {
                        Image(systemName: "trash")
                            .font(.title)
                    }
                }
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

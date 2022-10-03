//
//  BuildingMenu.swift
//  Campus
//
//  Created by Kevin Kelly on 10/2/22.
//

import SwiftUI

struct BuildingMenu: View
{
    @EnvironmentObject var manager : MapManager
    
    var body: some View
    {
        List
        {
            ForEach(manager.buildings)
            {
                building in
                
                Button
                {
                    manager.togglePresented(building: building)
                }
                label:
                {
                    HStack
                    {
                        Text(building.building.name)
                        
                        Spacer()
                        
                        Image(systemName: building.isPresented ? ViewConstants.pinned : ViewConstants.not_pinned)
                    }
                }
            }
        }
//        label:
//        {
//            Text("Presented Buildings")
//        }
    }
}

struct BuildingMenu_Previews: PreviewProvider {
    static var previews: some View {
        BuildingMenu()
            .environmentObject(MapManager())
    }
}

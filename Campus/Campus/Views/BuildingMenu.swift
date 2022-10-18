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
            // Save Changes Button
            Section
            {
                ExitSheetButton(text: "Save Changes")
            }
            
            // Quick Action buttons
            Section
            {
                QuickActionButtons()
            }
            header:
            {
                Text("Quick Actions")
            }
            
            Section
            {
                Picker("Filter List", selection: $manager.buildingListFilter)
                {
                    Text("All").tag(BuildingList.all)
                    Text("Favorite").tag(BuildingList.favorite)
                    Text("Nearby").tag(BuildingList.nearby)
                }
                .pickerStyle(.segmented)
            }
            header:
            {
                Text("Filter List")
            }
            
            // Individual Building Buttons
            Section
            {
                ForEach(manager.buildingList)
                {
                    building in
                    
                    Button
                    {
                        manager.togglePinned(building: building)
                    }
                    label:
                    {
                        HStack
                        {
                            Text(building.building.name)
                            
                            Spacer()
                            
                            Image(systemName: building.isPinned ? ViewConstants.pinned : ViewConstants.not_pinned)
                        }
                    }
                }
            }
            header:
            {
                Text("Please select the buildings to display.")
            }
        }
    }
}

struct BuildingMenu_Previews: PreviewProvider {
    static var previews: some View {
        BuildingMenu()
            .environmentObject(MapManager())
    }
}

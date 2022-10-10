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
                QuickSelectButtons()
            }
            header:
            {
                Text("Quick Select")
            }
            
            // Individual Building Buttons
            Section
            {
                ForEach(manager.buildings)
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

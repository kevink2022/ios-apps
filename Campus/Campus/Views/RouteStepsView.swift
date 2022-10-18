//
//  RouteStepsView.swift
//  Campus
//
//  Created by Kevin Kelly on 10/17/22.
//

import SwiftUI

struct RouteStepsView: View
{
    @EnvironmentObject var manager : MapManager
    
    var body: some View
    {
        List
        {
            Section
            {
                Button
                {
                    manager.route = nil
                    manager.sheet = .none
                    manager.showSheet = false
                }
                label:
                {
                    Text("Clear route")
                }
            }
            
            Section
            {
                ForEach(manager.routeSteps, id: \.self)
                {
                    step in Text(step)
                }
            }
        }
    }
}

struct RouteStepsView_Previews: PreviewProvider {
    static var previews: some View {
        RouteStepsView()
    }
}

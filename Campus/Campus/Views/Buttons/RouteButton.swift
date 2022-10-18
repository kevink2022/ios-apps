//
//  RouteButton.swift
//  Campus
//
//  Created by Kevin Kelly on 10/17/22.
//

import SwiftUI

struct RouteButton: View
{
    @EnvironmentObject var manager : MapManager
    
    var body: some View
    {
        Button
        {
            manager.sheet = .routeSteps
            manager.showSheet = true
        }
        label:
        {
            ZStack
            {
                Circle()
                    .foregroundColor(.white)
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2))
                
                Image(systemName: "list.bullet")
                    .font(.title)
            }
            .frame(height: 50)
        }
    }
}

struct RouteButton_Previews: PreviewProvider {
    static var previews: some View {
        RouteButton()
            .environmentObject(MapManager())
    }
}

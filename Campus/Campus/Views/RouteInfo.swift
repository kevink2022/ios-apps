//
//  RouteInfo.swift
//  Campus
//
//  Created by Kevin Kelly on 10/17/22.
//

import SwiftUI

struct RouteInfo: View
{
    @EnvironmentObject var manager : MapManager
    
    var body: some View
    {
        ZStack
        {
            ZStack
            {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .foregroundColor(.black)
            }
            
            VStack
            {
                
                HStack
                {
                    Image(systemName: "clock")
                    Text(manager.expectedTime)
                        .font(.title3)
                }
                
                
                HStack
                {
                    if manager.headingAngleToSelectedBuilding == -1
                    {
                        Image(systemName: "exclamationmark.triangle")
                    }
                    else
                    {
                        Image(systemName: "arrow.up")
                            .rotationEffect(Angle(degrees: manager.headingAngleToSelectedBuilding))
                        Text(String(format: "%.2f˚", manager.headingAngleToSelectedBuilding < 0 ? manager.headingAngleToSelectedBuilding + 360 : manager.headingAngleToSelectedBuilding ))
                            .font(.title3)
                    }
                }
            }
        }
        .frame(width: 125, height: 75)
    }
}

struct RouteInfo_Previews: PreviewProvider {
    static var previews: some View {
        RouteInfo()
            .environmentObject(MapManager())
    }
}

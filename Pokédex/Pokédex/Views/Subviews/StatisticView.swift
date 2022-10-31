//
//  StatisticView.swift
//  Pokédex
//
//  Created by Kevin Kelly on 10/20/22.
//

import SwiftUI

struct StatisticView: View
{
    typealias C = ViewConstants.StatisticView
    let title : String
    let label : String
    let value : Double
    let precision : Int
    
    
    var body: some View
    {
        VStack
        {
            Text(title)
                .font(C.titleFont)
            
            HStack
            {
                Text(String(format: "%.\(precision)f", value))
                    .font(C.valueFont)
                    
                Text(label)
                    .font(C.labelFont)
            }
        }
    }
}

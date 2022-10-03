//
//  FavoritedBuilding.swift
//  Campus
//
//  Created by Kevin Kelly on 9/30/22.
//

import Foundation

struct FavoritedBuilding : Codable, Identifiable
{
    let building    : Building
    var isFavorited : Bool
    var isPresented : Bool
    var id          : Int { self.building.id }
    
    static let standard = FavoritedBuilding(
        building: Building(
            latitude: 40.8122566279042,
            longitude: -77.8560684911546,
            name: "Beaver Stadium",
            opp_bldg_code: 812000,
            photo: "beaver",
            year_constructed: nil
        ),
        isFavorited: false,
        isPresented: false
    )
}

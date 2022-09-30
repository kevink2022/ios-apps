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
    var id          : Int { self.building.id }
}

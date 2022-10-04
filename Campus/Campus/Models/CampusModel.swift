//
//  CampusModel.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import Foundation

struct CampusModel : Codable
{
    var buildings : [FavoritedBuilding]
}

enum CampusSheets
{
    case none, detailView, buildingMenu
}

enum PresentedPins
{
    case none, pinned, favorited
}

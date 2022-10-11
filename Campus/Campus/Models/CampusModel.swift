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

struct CampusDirection
{
    let travelTime : String
    let heading : String
}

enum CampusSheets
{
    case none, detailView, buildingMenu
}

enum PresentedPins
{
    case none, pinned, favorited
}

extension CampusModel
{

}

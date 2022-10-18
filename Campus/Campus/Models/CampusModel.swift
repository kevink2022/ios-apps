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
    case none, detailView, buildingMenu, routeSteps
}

enum PresentedPins
{
    case none, pinned, favorited
}

enum BuildingList : String, CaseIterable, Identifiable
{
    case all, favorite, nearby
    var id: Self {self}
}

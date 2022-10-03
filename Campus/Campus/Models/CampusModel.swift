//
//  CampusModel.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import Foundation

struct Coordinates : Codable
{
    var latitude  : Double
    var longitude : Double
    
    static let psuCampus = Coordinates(latitude: 40.798214, longitude: -77.859909)
}

struct CampusModel : Codable
{
    static let centerCoord = Coordinates.psuCampus
    var buildings   : [FavoritedBuilding]
}

enum CampusSheets
{
    case none, detailView, buildingMenu
}

enum PresentedPins
{
    case none, presented, favorited
}

//
//  Building.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import Foundation

struct Building : Codable, Identifiable
{
    let latitude            : Double
    let longitude           : Double
    let name                : String
    let opp_bldg_code       : Int
    let photo               : String?
    let year_constructed    : Int?
    //var isFavorited         : Bool
    var id                  : Int { opp_bldg_code }
}



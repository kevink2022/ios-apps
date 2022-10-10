//
//  ManagerIntents.swift
//  Campus
//
//  Created by Kevin Kelly on 10/10/22.
//

import Foundation

extension MapManager
{
    func toggleFavorite(building: FavoritedBuilding)
    {
        if let index = model.buildings.firstIndex(where: {$0.id == building.id} )
        {
            model.buildings[index].isFavorited.toggle()
            // To get changes to propagate to sheet
            self.selectedBuilding = model.buildings[index]
        }
    }
    
    func togglePinned(building: FavoritedBuilding)
    {
        if let index = model.buildings.firstIndex(where: {$0.id == building.id} )
        {
            model.buildings[index].isPinned.toggle()
        }
    }
    
    func present(_ buildings: PresentedPins)
    {
        switch buildings
        {
        case .none:      self.presenting = .none
        case .pinned:    self.presenting = .pinned
        case .favorited: self.presenting = .favorited
        }
    }
    
    func showAll()
    {
        model.buildings = model.buildings.map
        {
            var new = $0
            new.isPinned = true
            return new
        }
    }
    
    func showFavorites()
    {
        model.buildings = model.buildings.map
        {
            var new = $0
            new.isPinned = new.isFavorited ? true : false
            return new
        }
    }
    
    func showNearby()
    {
        model.buildings = model.buildings.map
        {
            var new = $0
            new.isPinned = true
            return new
        }
    }
    
    func showNone()
    {
        model.buildings = model.buildings.map
        {
            var new = $0
            new.isPinned = false
            return new
        }
    }
}

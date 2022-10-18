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
        
        self.centerRegion()
    }
    
    func togglePinned(building: FavoritedBuilding)
    {
        if let index = model.buildings.firstIndex(where: {$0.id == building.id} )
        {
            model.buildings[index].isPinned.toggle()
        }
        
        self.centerRegion()
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
        
        self.centerRegion()
    }
    
    func showFavorites()
    {
        model.buildings = model.buildings.map
        {
            var new = $0
            new.isPinned = new.isFavorited ? true : false
            return new
        }
        
        self.centerRegion()
    }
    
    func showNearby()
    {
        model.buildings = model.buildings.map
        {
            var new = $0
            new.isPinned = self.buidlingNearby(building: new) ? true : false
            return new
        }
        
        self.centerRegion()
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
    
    func removePin(pin: FavoritedBuilding)
    {
        if let index = droppedPins.firstIndex(where: {$0.id == pin.id} )
        {
            droppedPins.remove(at: index)
        }
    }
    
    func deleteAllPins()
    {
        droppedPins.removeAll()
    }
}

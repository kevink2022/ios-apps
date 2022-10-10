//
//  MapManager.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import Foundation
import MapKit

class MapManager : ObservableObject
{
    private let storageManager : StorageManager<CampusModel>
    private let span = MapConstants.span
    var region : MKCoordinateRegion

    @Published var model        : CampusModel
    @Published var showSheet    : Bool = false
    @Published var sheet        : CampusSheets  = .none
    @Published var presenting   : PresentedPins = .pinned
    @Published var selectedBuilding : FavoritedBuilding
    
    
    init()
    {
        storageManager = StorageManager(fileName: "savedModel")
        
        var _model : CampusModel
        
        // If saved user data
        if let favoritedBuildings = storageManager.modelData
        {
            _model = favoritedBuildings
        }
        // else, need to initialize new fav's with regular buildings
        else
        {
            var buildings : Array<FavoritedBuilding> = []
            
            let buildingManager : StorageManager<[Building]> = StorageManager(fileName: "buildings")
            
            let normalBuildings = buildingManager.modelData ?? []
            
            for normalBuilding in normalBuildings
            {
                buildings.append(
                    FavoritedBuilding(
                        building: normalBuilding,
                        isFavorited: false,
                        isPinned: false
                    )
                )
            }
            
            _model = CampusModel(buildings: buildings)
        }
        
        region = MKCoordinateRegion(
            center: MapConstants.psuCampus,
            span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        )
        
        // This feels ugly, but is a lot cleaner then using an optional
        selectedBuilding = _model.buildings.first!
        
        // Sort alphabetically (numbers 1st)
        _model.buildings.sort
        {
            $0.building.name < $1.building.name
        }
        
        model = _model
    }
 }

extension MapManager
{
    var pinnedBuildings : [FavoritedBuilding]
    {
        self.model.buildings.filter { $0.isPinned == true }
    }
    
    var favoritedBuildings : [FavoritedBuilding]
    {
        self.model.buildings.filter { $0.isFavorited == true }
    }
    
    var buildings : [FavoritedBuilding] { self.model.buildings }
    
    var presentedBuildings : [FavoritedBuilding]
    {
        switch self.presenting
        {
        case .none:      return []
        case .pinned:    return self.pinnedBuildings
        case .favorited: return self.favoritedBuildings
        }
    }
    
    func save()
    {
        storageManager.save(modelData: model)
    }
}

struct MapConstants
{
    static let span = 0.03
    static let spanBuffer = 0.005
    static let psuCampus = CLLocationCoordinate2D(latitude: 40.798214, longitude: -77.859909)
}

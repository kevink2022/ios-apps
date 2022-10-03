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

    @Published var model : CampusModel
    @Published var selectedBuilding : FavoritedBuilding
    @Published var showSheet : Bool = false
    @Published var sheet : CampusSheets = .none
    @Published var presenting : PresentedPins = .none
    
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
                        isPresented: false
                    )
                )
            }
            
            _model = CampusModel(buildings: buildings)
        }
        
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(CampusModel.centerCoord),
            span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        )
        
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
    var presentedBuildings : [FavoritedBuilding]
    {
        self.model.buildings.filter { $0.isPresented == true }
    }
    
    var favoritedBuildings : [FavoritedBuilding]
    {
        self.model.buildings.filter { $0.isFavorited == true }
    }
    
    var buildings : [FavoritedBuilding] { self.model.buildings }
    
    var pinnedBuildings : [FavoritedBuilding]
    {
        switch self.presenting
        {
        case .none:      return []
        case .presented: return self.presentedBuildings
        case .favorited: return self.favoritedBuildings
        }
    }
    
    func save()
    {
        storageManager.save(modelData: model)
    }
    
    
    // MARK: Intents
    func toggleFavorite(building: FavoritedBuilding)
    {
        if let index = model.buildings.firstIndex(where: {$0.id == building.id} )
        {
            model.buildings[index].isFavorited.toggle()
            // To get changes to propagate to sheet
            self.selectedBuilding = model.buildings[index]
        }
    }
    
    func togglePresented(building: FavoritedBuilding)
    {
        if let index = model.buildings.firstIndex(where: {$0.id == building.id} )
        {
            model.buildings[index].isPresented.toggle()
        }
    }
}

struct MapConstants
{
    static let span = 0.03
}

extension CLLocationCoordinate2D
{
    init(_ coord: Coordinates)
    {
        self = CLLocationCoordinate2D(latitude: coord.latitude, longitude: coord.longitude)
    }
}

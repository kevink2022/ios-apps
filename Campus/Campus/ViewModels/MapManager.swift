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
    private let storageManager : StorageManager<[FavoritedBuilding]>
    
    private let span = MapConstants.span
    
    @Published var model : CampusModel
    var region : MKCoordinateRegion
    
    @Published var selectedBuilding : FavoritedBuilding? = nil
    @Published var showDetailSheet  : Bool = false
    
    
    
    
    
    
    init()
    {
        storageManager = StorageManager(fileName: "favoritedBuildings")
        
        var buildings : Array<FavoritedBuilding> = []
        
        // If saved user data
        if let favoritedBuildings = storageManager.modelData
        {
            buildings = favoritedBuildings
        }
        // else, need to initialize new fav's with regular buildings
        else
        {
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
        }
        
        let _model = CampusModel(buildings: buildings)
        
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(_model.centerCoord),
            span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        )
        
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
    
    
    // MARK: Intents
    func toggleFavorite(building: FavoritedBuilding)
    {
        if let index = model.buildings.firstIndex(where: {$0.id == building.id} )
        {
            model.buildings[index].isFavorited.toggle()
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

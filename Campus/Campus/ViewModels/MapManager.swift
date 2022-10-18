//
//  MapManager.swift
//  Campus
//
//  Created by Kevin Kelly on 9/29/22.
//

import Foundation
import MapKit

class MapManager : NSObject, ObservableObject
{
    private let storageManager : StorageManager<CampusModel>
    private let span = MapConstants.span
    let locationManager : CLLocationManager
    
    @Published var region : MKCoordinateRegion
    @Published var moveRegion : Bool = false
    @Published var droppedPins : [FavoritedBuilding] = []

    @Published var model        : CampusModel
    @Published var showSheet    : Bool          = false
    @Published var sheet        : CampusSheets  = .none
    @Published var presenting   : PresentedPins = .pinned
    @Published var trackingLocation : Bool      = false
    @Published var selectedBuilding : FavoritedBuilding
    var selectedDirections : CampusDirection
    // It won't let me assign a local var in the directions completion handler
    @Published var expectedTime = "Loading..."
    @Published var headingAngle : Double = 0
    @Published var route : MKRoute?
    @Published var buildingListFilter : BuildingList = .all

    @Published var mapConfig : MapConfigurations = .standard
    var currentLocation : CLLocation?
    
    
    override init()
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
        
        locationManager = CLLocationManager()
        
        selectedDirections = CampusDirection(travelTime: "", heading: "")
        
        super.init()
        
        locationManager.desiredAccuracy = .leastNonzeroMagnitude
        locationManager.delegate = self
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
    
    var headingAngleToSelectedBuilding : Double
    {
        if let from = currentLocation?.coordinate
        {
            let to = self.selectedBuilding.building

            let lat1 = from.latitude.radians
            let lon1 = from.longitude.radians

            let lat2 = to.latitude.radians
            let lon2 = to.longitude.radians

            let dLon = lon2 - lon1

            let y = sin(dLon) * cos(lat2)
            let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
            let radiansBearing = atan2(y, x)

            return radiansBearing.degrees
        }
        else
        {
            return -1
        }
    }
    
    var annotations : [FavoritedAnnotation]
    {
        (self.presentedBuildings + self.droppedPins).map
        {
            FavoritedAnnotation(building: $0)
        }
    }
    
    var buildingList : [FavoritedBuilding]
    {
        switch self.buildingListFilter
        {
        case .all       : return model.buildings
        case .favorite  : return model.buildings.filter{$0.isFavorited}
        case .nearby    : return model.buildings.filter{self.buidlingNearby(building: $0)}
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
    static let nearby = 0.075
}

enum MapConfigurations
{
    case standard, hybrid, imagery
}

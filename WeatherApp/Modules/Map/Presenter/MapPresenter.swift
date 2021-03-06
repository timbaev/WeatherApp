//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapPresenter: MapViewOutput, MapInteractorOutput, LocationDelegate, AutoCompleteDelegate, ImageManagerDelegate {
    
    weak var view: MapViewInput!
    var router: MapRouterProtocol!
    var interactor: MapInteractorInput!
    
    var currentPlace: Place?
    
    // MARK: - LocationDelegate
    
    func coordinatesResult(with coordinates: Coordinates) {
        let latitude = coordinates.latitude
        let longitude = coordinates.longitude
        view.setUserLocation(latitude: latitude, longitude: longitude)
    }
    
    // MARK: - MapViewOutput
    
    func getCoordinates() {
        interactor.getUsersCoordinates()
    }
    
    func viewIsReady() {
        view.setUpMap()
        view.getUserLocation()
    }
    
    func searchPlaces() {
        router.showAutoCompleteController()
    }
    
    func showWeatherScreen() {
        guard let place = currentPlace else { return }
        router.showWeatherScreen(with: place)
    }
    
    // MARK: - AutoCompleteDelegate
    
    func didFinishAutoComplete() {
        router.closeAutoCompleteController()
    }
    
    func showAutoCompleteError(with message: String) {
        router.showAutoCompleteErrorAlert(with: message)
    }
    
    func cityIsDefined(name: String, place: Place) {
        currentPlace = place
        interactor.getCoatOfArms(of: name, place: place)
    }
    
    
    
    // MARK: - MapInteractorOutput
    
    func getCoatOfArmsResult(with response: Response<MapInfo>, place: Place) {
        switch response {
        case .success(let mapInfo):
            guard let contentURL = mapInfo.value.first?.contentUrl else { return }
            interactor.getCoatOfArmsImage(from: contentURL, place: place)
        case .error(let errorMessage):
            router.showErrorAlert(with: errorMessage)
        }
    }
    
    // MARK: - ImageManagerDelegate
    
    func getCoatOfArms(image: PhotoModel, place: Place) {
        let latitude = place.latitude
        let longitude = place.longitude
        let placeName = place.placeName
        
        view.setCamera(latitude: latitude, longitude: longitude, placeName: placeName, image: image.photo)
    }
    
}

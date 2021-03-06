//
//  MapConfigurator.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapConfigurator {
    
    static func setUpModule(with viewController: MapView) {
        
        let presenter = MapPresenter()
        let interactor = MapInteractor()
        let router = MapRouter()
        let locationManager = LocationManager(delegate: presenter)
        let autoCompleteManager = AutoCompleteManager(delegate: presenter)
        let alertsFactory = CommonAlertsFactory()
        let mapApiProvider = MapApiProvider()
        let mapService = MapServiceImplementation(with: mapApiProvider)
        let imageManager = ImageManager(delegate: presenter)
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.presenter = presenter
        
        interactor.locationManager = locationManager
        interactor.mapService = mapService
        interactor.presenter = presenter
        interactor.imageManager = imageManager
        
        router.autoCompleteManager = autoCompleteManager
        router.view = viewController
        router.alertsFactory = alertsFactory
        
    }
    
}

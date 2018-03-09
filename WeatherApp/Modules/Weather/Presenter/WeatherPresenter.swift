//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherPresenter: WeatherViewOutput, WeatherInteractorOutput, WeatherModuleInput {
    
    weak var view: WeatherViewInput!
    var interactor: WeatherInteractorInput!
    var router: WeatherRouterProtocol!
    
    //MARK: - module input
    
    func setCity(_ city: String) {
        interactor.setCity(city)
    }
    
    func setCoordinates(longitude: Double, latidude: Double) {
        interactor.setCoordinates(Coordinates(longitude: longitude, latitude: latidude))
    }
    
    // MARK: - view output
    
    func viewIsReady() {
        interactor.getWeatherFromCoordinates()
    }
    
    // MARK: - interactor output
    
    func getWeatherSuccess(with weatherInfo: WeatherInfo) {
        guard let state = weatherInfo.weather.first?.description else { return }
        let temperature = "\(Int(weatherInfo.main.temp))°C"
        let sunriseDate = Date(timeIntervalSince1970: TimeInterval(weatherInfo.sys.sunrise))
        let sunsetDate = Date(timeIntervalSince1970: TimeInterval(weatherInfo.sys.sunset))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let sunriseTime = dateFormatter.string(from: sunriseDate)
        let sunsetTime = dateFormatter.string(from: sunsetDate)
        
        view.setState(state)
        view.setTemperature(temperature)
        view.setSunsetTime(sunriseTime)
        view.setSunsetTime(sunsetTime)
        view.setCityTitle(weatherInfo.name)
    }
    
    func getWeatherFailure(with message: String) {
        router.showErrorAlert(with: message)
    }
    
}
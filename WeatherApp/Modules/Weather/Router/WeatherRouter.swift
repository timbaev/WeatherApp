//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class WeatherRouter: WeatherRouterProtocol {
    
    weak var view: UIViewController!
    var alertsFactory: CommonAlertsFactoryProtocol!
    
    func showErrorAlert(with message: String) {
        let alert = alertsFactory.getErrorAlert(with: message)
        view.present(alert, animated: true, completion: nil)
    }
    
}
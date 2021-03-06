//
//  WeatherViewOutput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherViewOutput: class {
    
    /// View lifecycle
    func viewIsReady()
    
    /// Setup link to inner collection view
    ///
    /// - Parameter moduleInput: input class of inner collection view
    func setCollectionContainerModuleInput(_ moduleInput: ModuleInput)
    
}

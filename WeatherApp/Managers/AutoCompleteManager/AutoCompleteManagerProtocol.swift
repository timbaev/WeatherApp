//
//  AutoCompleteManagerProtocol.swift
//  WeatherApp
//
//  Created by Elina on 16/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

protocol AutoCompleteManagerProtocol {
    
    /// To get AutoCompleteController
    ///
    /// - Returns: view controller
    func getAutoCompleteController() -> UIViewController
    
}

//
//  Request.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import Alamofire

protocol Request {
    
    var method: HTTPMethod { get }
    var endPoint: String { get }
    var parameters: [String: Any] { get }
    
}

enum Methods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

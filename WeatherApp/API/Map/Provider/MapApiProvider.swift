//
//  MapApiProvider.swift
//  WeatherApp
//
//  Created by Elina on 17/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//


import Foundation
import Alamofire

class MapApiProvider: ApiProvider {
    
    var baseURL = URL(string: "https://api.cognitive.microsoft.com/bing/v7.0")
    
    let headers: HTTPHeaders = [
        "Ocp-Apim-Subscription-Key" : "ddeb057d4ea8459dbc364d2a1f2abd5c"
    ]
    
    func makeRequest(with request: Request, completionBlock: @escaping (Data?) -> Void) {
        guard let baseURL = self.baseURL else { return }
        let url = baseURL.appendingPathComponent(request.endPoint)
        
        let parameters = request.parameters
        
        Alamofire.request(url, method: request.method, parameters: parameters, headers: headers)
            .validate()
            .responseData { (response) in
                guard response.result.isSuccess else {
                    print("Error while make request: \(String(describing: response.result.error))")
                    completionBlock(nil)
                    return
                }
                
                guard let data = response.result.value else {
                    print("No data found in response")
                    completionBlock(nil)
                    return
                }
                
                completionBlock(data)
        }
    }
    
}

//
//  NetworkClient.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 15/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkClient{
    static let shared = NetworkClient()
    private init() {}
    
    func getSessionId(completionHandler: @escaping( _ success:Bool , _ errorString:String?) -> Void){
    }
    
    private  func getUrlFromParameters (_ parameters: [String:AnyObject]) -> URL{
        var components = URLComponents()
        let withPathExtension = HealthOS.apiPathExtension + HealthOS.apiPathExtensionAuth
        components.scheme = HealthOS.apiScheme
        components.host =  HealthOS.apiHost
        components.path = HealthOS.apiPath + (withPathExtension )
        
        components.queryItems = [URLQueryItem]()
        for (key , value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems?.append(queryItem)
        }
        return components.url!
    }
}

//
//  AlamofireManager+CustomHeader.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 16/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import Alamofire

class CustomRequestAdapter: RequestAdapter {
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        if let sessionId = getSessionId() {
            var request =  urlRequest
            request.setValue(sessionId, forHTTPHeaderField: NetworkClient.Header.Authorization)
            return request
        }else{
            fatalError("Failed to get SessionId")
        }
    }
    
    private func getSessionId() -> String? {
        if let path = Bundle.main.path(forResource: "HealthOS-Info", ofType:"plist"),let dict = NSDictionary(contentsOfFile: path){
            return dict[Constants.KeyApiKey] as? String
        }
        return nil
    }
}


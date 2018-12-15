//
//  NetworkClient+Constants.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 15/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation

extension NetworkClient{
    
    struct AuthenticationKeys {
        static let GrantType = "grant_type"
        static let ClientId = "client_id"
        static let ClientSecret = "client_secret"
        static let Scope = "scope"
    }
    
    struct AuthenticationValues {
        static let GrantTypeValue = "client_credentials"
        static let  ScopeValue = "public read write"
    }
    
    struct HealthOS {
        static let apiScheme = "https"
        static let apiHost = "www.healthos.co"
        static let apiPath = "/api"
        static let apiPathExtension = "/v1"
        static let apiPathExtensionAuth = "/oauth/token.json"
    }
    
    struct HealthOSResponseKeys {
        static let AccessToken = "access_token"
    }
    
}

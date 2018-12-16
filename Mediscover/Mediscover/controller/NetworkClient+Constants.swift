//
//  NetworkClient+Constants.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 15/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation

extension NetworkClient{
    
    struct Header {
        static let Authorization = "Authorization"
    }
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
        static let apiPathExtensionAllMedicines = "/medicines/brands"
    }
    
    struct ParameterKeys {
        static let Page = "page"
        static let Size = "size"
    }
    
    struct ParameterValues {
        static let DefaultPage = "1"
        static let DefaultSize = "40"
    }
    struct HealthOSResponseKeys {
        static let AccessToken = "access_token"
    }
    
//    {
//    "name": "VOLIX 0.3MG TABLET",
//    "form": "Tablet",
//    "standardUnits": 10,
//    "packageForm": "Strip",
//    "price": 109.5,
//    "size": "10  Tablet",
//    "manufacturer": "Ranbaxy Laboratories Ltd",
//    "constituents": [
//    {
//    "name": "Voglibose",
//    "strength": "0.3 mg"
//    }
//    ],
//    "schedule": {
//    "category": "OTC",
//    "label": "It can be sold without a prescription"
//    },
//    "medicine_id": "4141z"
//    }
    struct ResponceValues {
        static let Id = "medicine_id"
        static let Name = "name"
        static let Form = "form"
        static let Units = "standardUnits"
        static let PackageForm = "packageForm"
        static let Price = "price"
        static let Size = "size"
        static let Manufacturer = "manufacturer"
        static let Constituents = "constituents"
        static let Schedule = "schedule"
    }
    
}

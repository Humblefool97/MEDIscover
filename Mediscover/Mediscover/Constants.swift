//
//  Constants.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 15/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
struct Constants {
    static let HeathOsInfoList = "HealthOS-Info"
    static let KeyClientId = "ClientId"
    static let KeyClientSecret = "ClientSecret"
    static let KeyApiKey = "ApiKey"
    
    enum MedicineType : String {
        case Tablet,Cream,Infusion,Lotion,Gel, ointment,Capsule,Injection
        case TabletMD = "Tablet MD"
        case EyeDrop = "Eye Drop"
        case NasalDrop = "Nasal Drops"
        case EyeEarDrop = "EYE/EAR DROPS"
    }
}

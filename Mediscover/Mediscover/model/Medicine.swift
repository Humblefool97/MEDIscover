//
//  Medicine.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 16/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
//{
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
//        "category": "OTC",
//        "label": "It can be sold without a prescription"
//    },
//    "medicine_id": "4141z"
//}
class Medicine {
    var Id = ""
    var Name = ""
    var Form = ""
    var StandardUnits:Int = 0
    var PackageForm = ""
    var Price:Double = 0.0
    var Size = ""
    var Manufacturer = ""
    var Constituents:[Constituents] = []
    var ScheduleInst:Schedule = Schedule()
}

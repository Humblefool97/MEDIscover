//
//  HomeController.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 16/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import UIKit

class HomeController{
    static let Shared = HomeController()
    private init(){}
    
    fileprivate func parseResponse(_ result: [[String : AnyObject]], _ medicineArray: inout [Medicine]) {
        for item in result {
            let medicine:Medicine = Medicine()
            if let id = item[NetworkClient.ResponceValues.Id] as? String , let name = item[NetworkClient.ResponceValues.Name] as? String, let  price = item[NetworkClient.ResponceValues.Price] as? Double,
                let  schedule = item[NetworkClient.ResponceValues.Schedule] as?[String:String] , let constituents = item[NetworkClient.ResponceValues.Constituents] as? [[String:String]] , let  manufacturer = item[NetworkClient.ResponceValues.Manufacturer] as? String , let packageForm = item[NetworkClient.ResponceValues.PackageForm] as? String, let size = item[NetworkClient.ResponceValues.Size] as? String,let standardUnits = item[NetworkClient.ResponceValues.Units] as? Int{
                medicine.Id = id
                medicine.Name = name
                medicine.Manufacturer = manufacturer
                medicine.PackageForm = packageForm
                medicine.Size = size
                medicine.StandardUnits = standardUnits
                medicine.Price = price
                for constituent in constituents{
                    let constituentInst = Constituents()
                    if let constituentName = constituent["name"] , let strength = constituent["strength"]{
                        constituentInst.Name = constituentName
                        constituentInst.Strength = strength
                    }
                    medicine.Constituents.append(constituentInst)
                }
                if let category = schedule["category"] , let label = schedule["label"]{
                    let scheduleInst = Schedule()
                    scheduleInst.Category = category
                    scheduleInst.Label = label
                    medicine.ScheduleInst = scheduleInst
                }
                medicineArray.append(medicine)
            }
        }
    }
    
    func getMedicines(pageNum:String,
                      count:String,
                      completionHandler: @escaping( _ isSuccess:Bool,_ result:[Medicine]?,_ error:String?) ->Void){
        NetworkClient.shared.getMedicineList(pageNum: pageNum, count: count){
            (isSuccess,result,error) in
            
            if(!isSuccess){
                completionHandler(false,nil,error)
            }else {
                if let result = result{
                    var medicineArray:[Medicine] = []
                    self.parseResponse(result, &medicineArray)
                    completionHandler(true,medicineArray,nil)
                }
            }
        }
        
    }
}

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
    
    func getMedicineList(pageNum:String,count:String,completionHandler: @escaping(_ success:Bool,_ medicineList:[[String:AnyObject]]?,_ error:String?) -> Void){
        
        let params = [NetworkClient.ParameterKeys.Page:pageNum,
                      NetworkClient.ParameterKeys.Size:count]
        let url = getUrlFromParameters(params as [String : AnyObject], NetworkClient.HealthOS.apiPathExtensionAllMedicines)
        // get a session manager and add the request adapter
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.adapter = CustomRequestAdapter()
        
        let request = sessionManager.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default)
        request.responseJSON{ responseData in
            switch responseData.result{
            case .success :
                if let response = responseData.result.value{
                  let json = JSON(response)
                    print(json.arrayObject as? [[String:AnyObject]] ?? "No value")
                    completionHandler(true,json.arrayObject as? [[String:AnyObject]],nil)
                }else{
                    completionHandler(false,nil,"Something went wrong!Please try again")
                }
            case .failure(let error):
                completionHandler(false,nil,error.localizedDescription)
            }
            
        }
        
        
    }
    private  func getUrlFromParameters (_ parameters: [String:AnyObject], _ pathExtension:String) -> URL{
        var components = URLComponents()
        let withPathExtension = HealthOS.apiPathExtension + pathExtension
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

//
//  LoginController.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 14/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginController {
    
    func handleSignIn(userName:String,passowrd:String,
                        completionHandler : @escaping ( _ success:Bool,
        _ errorString:String?) -> Void) {
        
        guard (!userName.isEmpty || !passowrd.isEmpty) else {
            completionHandler(false,"Username / password cannot be empty")
            return
        }
        
        Auth.auth().signIn(withEmail: userName, password: passowrd){
            (userInfo,error) in
            if let error = error {
                completionHandler(false,error.localizedDescription)
                return
            }else{
                completionHandler(true,nil)
            }
        }
    }
}

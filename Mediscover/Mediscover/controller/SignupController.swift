//
//  SignupController.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 14/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import FirebaseAuth

//TODO:Do it in login controller
class SignupController {
    func handleSignUp(userName:String,passowrd:String,
                      completionHandler : @escaping ( _ success:Bool,
        _ errorString:String?) -> Void) {
        
        guard (!userName.isEmpty || !passowrd.isEmpty) else {
            completionHandler(false,"Username / password cannot be empty")
            return
        }
        
        Auth.auth().createUser(withEmail: userName, password: passowrd){
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

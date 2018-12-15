//
//  SignUpViewController.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 14/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import UIKit
import Foundation

class SignUpViewController: BaseViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.isHidden = true
    }

     func handleSignUp() {
        let userName = emailText.text ?? ""
        let password = passwordText.text ?? ""
        let signupVc = SignupController()
        progressIndicator.isHidden = false
        progressIndicator.startAnimating()
        signupVc.handleSignUp(userName: userName, passowrd: password){
            (isSuccess,errorString) in
            self.progressIndicator.isHidden = true
            self.progressIndicator.stopAnimating()
            
            if isSuccess == false {
                if let errorMsg = errorString {
                    self.displayAlerMessage(message: errorMsg)
                }
            }else{
              self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func onSignUpClick(_ sender: Any) {
        handleSignUp()
    }

}

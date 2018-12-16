//
//  ViewController.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 14/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.isHidden = true
    }
    @IBAction func onSignInClick(_ sender: Any) {
        let userName = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let loginController = LoginController()
        progressIndicator.isHidden = false
        progressIndicator.startAnimating()
        loginController.handleSignIn(userName: userName, passowrd: password){
            (isSuccess,errorString) in
            if isSuccess == false {
                if let errorMsg = errorString {
                    self.displayAlerMessage(message: errorMsg)
                    self.progressIndicator.stopAnimating()
                    self.progressIndicator.isHidden = true
                }
            }else{
                //Move to Home screen
                let storyBoard: UIStoryboard = UIStoryboard(name: "PostLogin", bundle: nil)
                let viewController = storyBoard.instantiateViewController(withIdentifier: "PostLogin")
                self.present(viewController, animated:true, completion:nil)
            }
        }
    }
}

extension LoginViewController:FUIAuthDelegate{
    
}

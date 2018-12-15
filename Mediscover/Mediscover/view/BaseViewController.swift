//
//  BaseViewController.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 14/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayAlerMessage(message:String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style:.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

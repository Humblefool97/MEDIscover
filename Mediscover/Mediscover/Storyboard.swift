//
//  Storyboard.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 15/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryBoard : String {
    case Main,PostLogin
    
    var instance:UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T{
        let storyBoardId = (viewControllerClass as UIViewController.Type).storyBoardId
        return instance.instantiateViewController(withIdentifier: storyBoardId) as! T
    }
}

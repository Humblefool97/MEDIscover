//
//  UIViewController+StoryBoardId.swift
//  Mediscover
//
//  Created by Rajeev Ranganathan on 15/12/18.
//  Copyright © 2018 Rajeev Ranganathan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    class var storyBoardId:String {
        return "\(self)"
    }
    
    static func instantiateVcFromStoryboard(appStoryboard:AppStoryBoard) -> Self{
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

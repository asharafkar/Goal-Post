//
//  UIViewControllerExtention.swift
//  Goal Post
//
//  Created by Amir on 3/31/19.
//  Copyright © 2019 Amir Sharafkar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func presentDetail(_ viewController: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewController, animated: false, completion: nil)
    }
    
    func dismissDetail(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}

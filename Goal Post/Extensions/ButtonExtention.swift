//
//  ButtonExtention.swift
//  Goal Post
//
//  Created by Amir on 3/31/19.
//  Copyright © 2019 Amir Sharafkar. All rights reserved.
//

import UIKit

extension UIButton{
    
    func hasBeenSelected(){
        self.backgroundColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 1, alpha: 1)
    }
    
    func hasBeenDeselected(){
        self.backgroundColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 1, alpha: 0.5973351884)
    }
}

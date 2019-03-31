//
//  CreateGoalVC.swift
//  Goal Post
//
//  Created by Amir on 3/31/19.
//  Copyright © 2019 Amir Sharafkar. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    var goalType: GoalType = GoalType.shortTerm
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfigure()

    }
    
    func uiConfigure(goalType: GoalType = GoalType.shortTerm){
        self.goalType = goalType
        switch goalType {
        case .shortTerm:
            shortTermButton.hasBeenSelected()
            longTermButton.hasBeenDeselected()
            break
        case .longTerm:
            shortTermButton.hasBeenDeselected()
            longTermButton.hasBeenSelected()
            break
        }
    }
    
    @IBAction func shortTermPressed(_ sender: UIButton) {
        uiConfigure(goalType: .shortTerm)
    }
    
    @IBAction func longTermPressed(_ sender: UIButton) {
         uiConfigure(goalType: .longTerm)
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismissDetail()
    }
    
    
}

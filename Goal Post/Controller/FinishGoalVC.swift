//
//  FinishGoalVC.swift
//  Goal Post
//
//  Created by Amir on 4/1/19.
//  Copyright © 2019 Amir Sharafkar. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController {

    @IBOutlet weak var goalPointsTextField: UITextField!
    
    var goalDescription: String?
    var goalType: GoalType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initData(description: String, goalType: GoalType){
        self.goalDescription = description
        self.goalType = goalType
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismissDetail()
    }
    
}

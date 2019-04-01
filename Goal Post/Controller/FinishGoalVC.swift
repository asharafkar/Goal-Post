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
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initData(description: String, goalType: GoalType){
        self.goalDescription = description
        self.goalType = goalType
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        if goalPointsTextField.text != ""{
            createGoal { (created) in
                if created{
                    dismissDetail()
                }else{
                    
                }
            }
        }
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismissDetail()
    }
    
    func createGoal(completion: (_ created: Bool) -> ()){
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = GoalEntity(context: managedContext)
        goal.desc = goalDescription
        goal.type = goalType.rawValue
        goal.completeValue = Int32(goalPointsTextField.text!)!
        goal.progressValue = Int32(0)
        
        do{
            try managedContext.save()
            print("Successfully saved data")
            completion(true)
        }catch{
            debugPrint("Could not save: \n \(error.localizedDescription)")
            completion(false)
        }
    }
    
}

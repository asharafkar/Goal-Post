//
//  ViewController.swift
//  Goal Post
//
//  Created by Amir on 3/22/19.
//  Copyright © 2019 Amir Sharafkar. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var goals: [GoalEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    

    @IBAction func addGoalPressed(_ sender: UIButton) {
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(viewController)
    }
    
}

extension GoalVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()
        }
        
        let goal = goals[indexPath.row]
        
        cell.configure(goal: goal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction, indexPath) in
            self.removeGoal(indexPath: indexPath)
            self.fetchData()
            //tableView.deleteRows(at: [indexPath], with: .none)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
         return [deleteAction]
    }
    
    func fetchData(){
        self.fetch { (completed) in
            if completed{
                if goals.count >= 1{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }else{
                
            }
            tableView.reloadData()
        }
    }
}

extension GoalVC{
    
    func fetch(completion: (_ completed: Bool) -> ()){
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<GoalEntity>(entityName: "GoalEntity")
        
        do{
            goals = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data.")
            completion(true)
        }catch{
            debugPrint("Could not ferched: \n \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func removeGoal(indexPath: IndexPath){
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(goals[indexPath.row])
        
        do{
            try managedContext.save()
            print("Successfully removed.")
        }catch{
            debugPrint("Could not remove:\n \(error.localizedDescription)")
        }
    }
}



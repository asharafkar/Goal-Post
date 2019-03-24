//
//  GoalCell.swift
//  Goal Post
//
//  Created by Amir on 3/24/19.
//  Copyright © 2019 Amir Sharafkar. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(description: String, type: GoalType, progress: Int){
        descriptionLabel.text = description
        typeLabel.text = type.rawValue
        progressLabel.text = "\(progress)"
    }

}

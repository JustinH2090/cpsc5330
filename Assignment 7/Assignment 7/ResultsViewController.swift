//
//  ResultsViewController.swift
//  Assignment 7
//
//  Created by Justin.Hensley on 2025-07-03.
//

import UIKit

class ResultsViewController: UIViewController {
    var f : String!
    var food : FoodResult!
                
    @IBOutlet weak var reultsLabel: UILabel! //accidental typo here, its so slow to refactor on this
                                            // machine. Just gonna leave it for now.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        food = FoodResult(f)
        
        let a = food.name + "\nCalories: "
        + String(food.cal) + "\nFat: "
        + String(food.fat) + "\nCarbs: "
        + String(food.carb) + "\nProtien: "
        + String(food.prot)
        
        reultsLabel.text = a
    }

}

//
//  ResultsViewController.swift
//  Assignment Bonus
//
//  Created by Justin.Hensley on 2025-07-03.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValue:Double!
    var bmiCategory:String!
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var stringLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = String(bmiValue)
        stringLabel.text = bmiCategory
        
    }
    
    
    

}

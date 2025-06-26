//
//  ResultsViewController.swift
//  Assignment 6
//
//  Created by Justin.Hensley on 2025-06-26.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var ResultsLabel: UILabel!
    var aa: [CurrencyType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard isViewLoaded, let ResultsLabel = ResultsLabel else {
                print("error")
                return
            }
        var x = ""
        for currency in aa{
            x += "\(currency.name): \(String(format: "%.2f", currency.ratio))\n"
        }
        ResultsLabel.text = x
    }

}

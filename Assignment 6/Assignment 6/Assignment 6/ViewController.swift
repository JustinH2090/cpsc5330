//
//  ViewController.swift
//  Assignment 6
//
//  Created by Justin.Hensley on 2025-06-25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dollarsInput: UITextField!
    @IBOutlet weak var switchMM: UISwitch!
    @IBOutlet weak var switchORP: UISwitch!
    @IBOutlet weak var switchWOW: UISwitch!
    @IBOutlet weak var switchEurp: UISwitch!
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToResults(_ sender: UIButton) {
        let results = ResultsViewController()
        self.present(results, animated: true, completion: nil)
        
        
    }
    
    var a: [CurrecyType] = []
    
    if switchMM.isOn{
        a.append(CurrencyType(name: "MonopolyMoney",ratio: 0))
    }
    if switchORP.isOn{
        a.append(CurrencyType(name: "Old Roman Denarius",ratio: 1.0/50.0))
    }
    if switchWOW.isOn{
        a.append(CurrencyType(name: "MonopolyMoney",ratio: 1200000.0 / 57.09))
    }
    if switchEurp.isOn{
        a.append(CurrencyType(name: "MonopolyMoney",ratio: 1.0/1.17))
    }
    
}


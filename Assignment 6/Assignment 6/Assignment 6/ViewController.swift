//
//  ViewController.swift
//  Assignment 6
//
//  Created by Justin.Hensley on 2025-06-25.
//

import UIKit

class ViewController: UIViewController {
    
    
    var a: [CurrencyType] = []
    
    
    @IBOutlet weak var DollarInput: UITextField!
    @IBOutlet weak var switchMM: UISwitch!
    @IBOutlet weak var switchORP: UISwitch!
    @IBOutlet weak var switchWOW: UISwitch!
    @IBOutlet weak var switchEurp: UISwitch!
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    @IBAction func goToResults(_ sender: UIButton) {
        checkSwitches()
        self.performSegue(withIdentifier: "toResults", sender: self)

    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard segue.identifier == "toResults" else { return }
      if let results = segue.destination as? ResultsViewController {
        results.aa = a
      } else {
        print("Error in prepare")
      }
    }

    
    func checkSwitches(){
        a.removeAll()
        let b = Double(DollarInput.text ?? "") ?? 0.0
        
        if switchMM.isOn{
            a.append(CurrencyType(name: "MonopolyMoney",ratio: b * 0))
        }
        if switchORP.isOn{
            a.append(CurrencyType(name: "Old Roman Denarius",ratio: b * (1.0/50.0)))
        }
        if switchWOW.isOn{
            a.append(CurrencyType(name: "WoW Gold",ratio: b * (1200000.0 / 57.09)))
        }
        if switchEurp.isOn{
            a.append(CurrencyType(name: "Euro",ratio: b * (1.0/1.17)))
        }
        
    }
    
    
    
    
}


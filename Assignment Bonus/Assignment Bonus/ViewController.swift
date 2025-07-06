//
//  ViewController.swift
//  Assignment Bonus
//
//  Created by Justin.Hensley on 2025-07-03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var feetInput: UITextField!
    @IBOutlet weak var inchesInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var switchIM: UISwitch!
    @IBOutlet weak var miscText: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        switchIM.isOn = false
        update()
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {update()}
    
    func update(){
        if(switchIM.isOn){
            feetInput.placeholder = "Centimeter"
            inchesInput.isEnabled = false
            inchesInput.text = nil
            inchesInput.placeholder = nil
            weightInput.placeholder = "Kilograms"
            miscText.text = "Enter CM for height and KG for weight"
            
        }else{
            feetInput.placeholder = "Feet"
            inchesInput.isEnabled = true
            inchesInput.placeholder = "Inches"
            weightInput.placeholder = "Pounds"
            miscText.text = "Enter height as feet(i.e 5), inches(i.e 10), weight in pounds"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "toResults",
            let resultVC = segue.destination as? ResultsViewController
        else {return}
        
        if switchIM.isOn {
                let h = Int(feetInput.text ?? "") ?? 0
                let w = Double(weightInput.text ?? "") ?? 0

                let metricCalc = BMICalcMetric(heightCM: h,weightKG: w)
            
                let convert = metricCalc.toImperialCalc()
                resultVC.bmiValue = convert.calcBMI()
                resultVC.bmiCategory = convert.showCatBMI()

           } else {
                let f = Int(feetInput.text ?? "") ?? 0
                let i = Int(inchesInput.text ?? "") ?? 0
                let w = Double(weightInput.text ?? "") ?? 0

                let impCalc = BMICalc(heightFeet:f,heightInch:i,weight:w)
               
                resultVC.bmiValue = impCalc.calcBMI()
                resultVC.bmiCategory = impCalc.showCatBMI()
           }
    }

    @IBAction func calcButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toResults", sender: sender)
        
    }

}


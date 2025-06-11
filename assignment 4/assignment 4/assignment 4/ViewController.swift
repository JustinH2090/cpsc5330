//
//  ViewController.swift
//  assignment 4
//
//  Created by Justin.Hensley on 2025-06-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AppTitle: UILabel!
    @IBOutlet weak var MoodLabel: UILabel!
    @IBOutlet weak var MoodScale: UISlider!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var MoodMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MoodScale.minimumValue = 1
        MoodScale.maximumValue = 10
        MoodScale.isContinuous = true
        
        updateDateLabel()
        MoodMessage.isEnabled = false
        updateUI(for: Int(MoodScale.value.rounded()))
       
        
    }
    func updateUI(for mood: Int){
        let message: String
        
        if (mood == 1 || mood == 2 || mood == 3){
            message = "awful mood dected"
        }else if (mood == 4 || mood == 5 || mood == 6){
            message = "poor mood dected"
        }else if (mood == 7 || mood == 8 || mood == 9){
            message = "great mood dected"
        }else if (mood == 10){
            
            message = "outstanding mood dected"
        }else{
            message = "no mood selected"
        }
        
        MoodLabel.text = message
    }
    
    func updateDateLabel(with date: Date = Date()){
        let a = DateFormatter()
        a.dateStyle = .medium
        a.timeStyle = .none
        let dateString = a.string(from: Date())
        DateLabel.text = dateString
    }
   
    func updateMoodMessage(with msg: String = ""){
        
    }

    @IBAction func onScaleMove(_ sender: UISlider) {
        updateUI(for: Int(sender.value.rounded()))
        
    }
    
    @IBAction func onSaveMoodButton(_ sender: Any) {
        let a = DateFormatter()
        a.dateStyle = .medium
        a.timeStyle = .none
        let dateString = a.string(from: Date())

        let nowMood = Int(MoodScale.value.rounded())

        var message = ""
        message += "On \(dateString) you felt \(nowMood)."

        MoodMessage.text = message
    }
    
    
    
    
    
    
}


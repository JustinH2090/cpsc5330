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
    //@IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var MoodMessage: UILabel!
    @IBOutlet weak var MainView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MoodScale.minimumValue = 0
        MoodScale.maximumValue = 100
        MoodScale.isContinuous = true
        
        //updateDateLabel()
        MoodMessage.isEnabled = false
        updateUI(for: Int(MoodScale.value.rounded()))
       
        
    }
    func updateUI(for mood: Int){
        let message: String
        
        if (mood >= 0 && mood <= 20){
            message = " Very Sad 😢"
        }else if (mood >= 21 && mood <= 40){
            message = "Sad 🙁"
        }else if (mood >= 41 && mood <= 60){
            message = "Neutral 😐"
        }else if (mood >= 61 && mood <= 80){
            message = " Happy 🙂"
        }else if (mood >= 81 && mood <= 100){
            message = "Very Happy 😄"
        }else{
            message = "no mood selected"
        }
        
        MoodLabel.text = message
    }
    /*
    func updateDateLabel(with date: Date = Date()){
        let a = DateFormatter()
        a.dateStyle = .medium
        a.timeStyle = .none
        let dateString = a.string(from: Date())
        DateLabel.text = dateString
    }*/
   /*
    func updateMoodMessage(with msg: String = ""){
        
    }*/

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
        MoodMessage.isEnabled = true
    }

    
}


//
//  ViewController.swift
//  Assignment 5
//
//  Created by Justin.Hensley on 2025-06-18.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var MainView: UIStackView!
    @IBOutlet weak var MessageView: UIView!
    @IBOutlet weak var DirectionView: UIStackView!
    
    @IBOutlet weak var QuestText: UILabel!
    
    @IBOutlet weak var LeftView: UIView!
    @IBOutlet weak var FowardBackView: UIStackView!
    @IBOutlet weak var RightView: UIView!
    
    @IBOutlet weak var LeftButton: UIButton!
    @IBOutlet weak var FowardButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    
    
    var game = Game()
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        game.start()
        updateView()
    }
    
    func updateView(){
        QuestText.text = game.current?.quest
        
        if game.visited.count <= 1 {BackButton.isEnabled = false}
        else {BackButton.isEnabled = true}
        
        if game.visited.count > 2 {LeftButton.isEnabled =  false}
        else {LeftButton.isEnabled = true}
        
        if game.visited.count > 3 {RightButton.isEnabled = false}
        else {RightButton.isEnabled = true}
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        caughtOrEscape()
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        game.moveToPreviousArea()
        game.roomCount += 1
        updateView()
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        caughtOrEscape()
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        caughtOrEscape()
    }
    
    func caughtOrEscape(){
        if !game.moveToNewArea() {
            if game.roomCount < 8 {QuestText.text = "It caught you. Game Over."}
            else {QuestText.text = "You've escaped... for now."}
            
            disableAllButtons()
            return
        }
        updateView()
    }
    
    func disableAllButtons() {
        LeftButton.isEnabled = false
        FowardButton.isEnabled = false
        RightButton.isEnabled = false
        BackButton.isEnabled = false
    }
}


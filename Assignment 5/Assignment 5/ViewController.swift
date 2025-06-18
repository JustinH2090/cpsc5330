//
//  ViewController.swift
//  Assignment 5
//
//  Created by Justin.Hensley on 2025-06-18.
//

import UIKit

struct Quest{
    
    init(_ questIn: String){
        quest = questIn
    }
    
    var quest: String
}

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
    
    
    let quest = [
        Quest("Area 1"),
        Quest("Area 2"),
        Quest("Area 3"),
        Quest("Area 4"),
        Quest("Area 5"),
        Quest("Area 6")
    ]
    
    var visited: [Quest] = []
    var current: Quest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        start()
    }
    
    func start(){
        current = quest[0]
        visited.append(quest[0])
        updateView()
    }
    
    func updateView(){
        QuestText.text = current?.quest
                
        if visited.count <= 1 {BackButton.isEnabled = false}
        else {BackButton.isEnabled = true}
    }
    
    func visitedArea() {
        var previous: [Quest] = []
        for v in visited {if v.quest != current?.quest {previous.append(v)}}
        
        let backAreaA = previous.randomElement()

        if backAreaA != nil {
            let backAreaB = backAreaA!
            current = backAreaB
            updateView()
        }

    }

    func newArea() {
        var unvisited: [Quest] = []
        for area in quest {
            var alreadyVisited = false
            for v in visited {
                if v.quest == area.quest {
                    alreadyVisited = true
                    break
                }
            }
            if !alreadyVisited {unvisited.append(area)}
        }

        if unvisited.isEmpty {
            QuestText.text = "Game Over"
            LeftButton.isEnabled = false
            FowardButton.isEnabled = false
            RightButton.isEnabled = false
            BackButton.isEnabled = false
            return
        }
        
        let next = unvisited.randomElement()
        if next != nil {
            current = next!
            visited.append(next!)
            updateView()
        }

    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        newArea()
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        visitedArea()
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        newArea()
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        newArea()
    }
}


//
//  Game.swift
//  Assignment 5
//
//  Created by Justin.Hensley on 2025-06-21.
//

import Foundation

struct Quest{let quest: String}

class Game{
        
    let questList = [
        Quest(quest: "A giant monster has chased you into a house. You're in the Main Room."),
        Quest(quest: "You've entered the Dining Room. There is food prepared on a table"),
        Quest(quest: "You've entered the Kitchen. All the cabinets are open"),
        Quest(quest: "You've entered the Foyer. There is a painting of thing chasing you on the wall"),
        Quest(quest: "You've entered the Storage Room. It's dark in here and you can't tell what's going on"),
        Quest(quest: "You've entered the Den. There is a TV with permanent static/white noise")
    ]
    
    var visited: [Quest] = []
    var current: Quest?
    var roomCount: Int = 0
    
    func start(){
        current = questList[0]
        visited.append(questList[0])
        
    }
    
    func getUnvisited() -> [Quest] {
            var unvisited: [Quest] = []
            for area in questList {
                var alreadyVisited = false
                for v in visited {
                    if v.quest == area.quest {
                        alreadyVisited = true
                        break
                    }
                }
                if !alreadyVisited {
                    unvisited.append(area)
                }
            }
            return unvisited
        }
    
    func moveToPreviousArea() {
            var previous: [Quest] = []
            for v in visited {
                if v.quest != current?.quest {
                    previous.append(v)
                }
            }
            
            let backOptional = previous.randomElement()
            if backOptional != nil {
                current = backOptional!
            }
        }

    func moveToNewArea() -> Bool {
            let unvisited = getUnvisited()
            roomCount += 1
            
            if unvisited.isEmpty {
                return false
            }
            
            let nextOptional = unvisited.randomElement()
            if nextOptional != nil {
                let next = nextOptional!
                current = next
                visited.append(next)
            }
            return true
        }
}

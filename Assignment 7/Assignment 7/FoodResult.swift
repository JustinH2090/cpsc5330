//
//  FoodResult.swift
//  Assignment 7
//
//  Created by Justin.Hensley on 2025-07-03.
//

import Foundation

struct FoodResult{
    var name : String
    var cal : Int = 0
    var fat : Int = 0
    var carb: Int = 0
    var prot : Int = 0
    init(_ name:String){
        self.name = name
        selectFood(_name: name)
    }
    
    mutating func selectFood(_name:String){
        switch name {
        case "Chicken and Rice":
            cal  = 266; fat  = 9; carb = 11; prot = 34
        case "Pintos and Greens":
            cal  = 176; fat  =  2; carb = 30; prot = 12
        case "Ham Sandwhich":
            cal  = 409; fat  = 14; carb = 48; prot = 22
        case "Bowl of Cereal":
            cal  = 377; fat  = 8; carb = 68; prot = 11
        case "Two Egg and Toast":
            cal  = 319; fat  = 12; carb = 31; prot = 21
        case "Sugar Free Jello":
            cal  =   10; fat  =  0; carb =  2; prot =  0
        case "Pepperoni Pizza Slice":
            cal  = 313; fat  = 13; carb = 35; prot = 13
        case "Water with Flavoring":
            cal  =   5; fat  =  0; carb =  1; prot =  0
        case "Diet Soda":
            cal  =   0; fat  =  0; carb =  0; prot =  0
        case "Snickers Bar":
            cal  = 215; fat  = 11; carb = 28; prot =  3
            
        default:
            break;
        }
    }
}

//
//  BMICalc.swift
//  Assignment Bonus
//
//  Created by Justin.Hensley on 2025-07-04.
//

import Foundation

struct BMICalc{
    var heightFeet:Int
    var heightInch:Int
    var weight:Double
    var totalInch:Int
    
    init(heightFeet:Int, heightInch:Int, weight:Double){
        self.heightFeet = heightFeet
        self.heightInch = heightInch
        self.weight = weight
        self.totalInch = (heightFeet*12)+heightInch
        
    }
    
    func calcBMI()->Double{// (weight / (height*height))*703
        let a = Double(totalInch)
        return (weight / (a*a)) * 703
    }
    
    func showCatBMI()->String{
        let a = calcBMI()
        var b: String
        b = ""
        
        if(a < 18.5){
            //underweight
            b = "Underweight"
        }else if(a >= 18.5 && a <= 24.9){
            //healthy weight
            b = "Healthy Weight"
        }else if(a >= 25 && a <= 29.9){
            //overweight
            b = "Overweight"
        }else if(a >= 30 && a <= 34.5){
            //obese class 1
            b = "Obese Class 1"
        }else if(a >= 35 && a <= 39.9){
            //obese class 2
            b = "Obese Class 2"
        }else if(a >= 40){
            //obese class 3
            b = "Obese Class 3"
        }else {b = "Error calculating weight class"}
        
        return b
    }
}

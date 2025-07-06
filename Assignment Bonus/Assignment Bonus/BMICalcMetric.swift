//
//  BMICalcMetric.swift
//  Assignment Bonus
//
//  Created by Justin.Hensley on 2025-07-04.
//

import Foundation

struct BMICalcMetric{
    var heightCM:Int
    var weightKG:Double
    
    init(heightCM:Int,weightKG:Double){
        self.heightCM = heightCM
        self.weightKG = weightKG
    }
    
    func calcBMIMetric()->Double{//(weight / (height * height)) * 10000
        let a : Double
        a = ( Double(weightKG) / (Double (heightCM) * Double (heightCM))) * 10000
        return a
    }
    
    func showCatBMI()->String{
        let a = calcBMIMetric()
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
    func convertWeightToImperial()->Double{
        return weightKG * 2.205
    }
    func convertHeightToImperial()->Double{
        let a = Double(heightCM) / 2.54
        //let a = Double(heightCM) * 0.393701
        return Double(a)
    }
    
    func toImperialCalc() -> BMICalc {
        let totalInches = convertHeightToImperial().rounded()
        let f = Int (totalInches) / 12
        let i = Int (totalInches) % 12
        let w = convertWeightToImperial()
        return BMICalc(heightFeet:f,heightInch:i,weight:w)
    }
}

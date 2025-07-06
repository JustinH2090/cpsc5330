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
    
    func convertWeightToImperial()->Double{
        return weightKG * 2.2
    }
    func convertHeightToImperial()->Int{
        let a = Double(heightCM) / 2.54
        return Int(a)
    }
    
    func toImperialCalc() -> BMICalc {
        let totalInches = convertHeightToImperial()
        let f = totalInches / 12
        let i = totalInches % 12
        let w = convertWeightToImperial()
        return BMICalc(heightFeet:f,heightInch:i,weight:w)
    }
}

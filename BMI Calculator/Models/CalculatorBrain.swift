//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Matthew Cheung on 24/1/2023.


import UIKit

struct CalculatorBrain{
    var bmi: BMI?
 
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight/pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You are a Skeleton!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }else if  bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "You fit like Thor!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, advice: "You are a bad ass!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    func getBMIValue() -> String{
        let bmiResult = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiResult
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "SomeThing ran Wrong"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .red
    }
}

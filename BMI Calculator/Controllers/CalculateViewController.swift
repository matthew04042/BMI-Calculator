//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Matthew Cheung on 23/1/2023.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSilder: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightSilder: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = "\(round(sender.value*100)/100.0)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(Int(round(sender.value)))Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton){
        calculatorBrain.calculateBMI(height: heightSilder.value, weight: weightSilder.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}


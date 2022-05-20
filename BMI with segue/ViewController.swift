//
//  ViewController.swift
//  BMI with segue
//
//  Created by Zhanagul on 23.04.2022.
//

import UIKit

class ViewController: UIViewController {
    


    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didHeightChange(_ sender: UISlider) {
        let formattedValue = String(format: "%.2f", heightSlider.value)
        label1.text = formattedValue
    }
    
    @IBAction func didWeightChange(_ sender: UISlider) {
        let formattedValue = String(format: "%.2f", weightSlider.value)
        label2.text =  formattedValue
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ResultViewController {
            let bmi = (weightSlider.value / (heightSlider.value * heightSlider.value))
            let formatter = String(format: "%.1f", bmi)
            resultVC.index = formatter
            
            switch bmi {
                
            case (18.5...24.9):
                resultVC.labelForSuggestion = "Normal weight. Your result is excellent! Keep going in this way!"
                resultVC.view.backgroundColor = .green
            case (0...18.4):
                resultVC.labelForSuggestion = "Underweight. Please, eat more pies"
                resultVC.view.backgroundColor = .cyan
            case (25...29.9):
                resultVC.labelForSuggestion = "Overweight. Ooops! You have to eat less pies!"
                resultVC.view.backgroundColor = .orange
            case (30...39.9):
                resultVC.labelForSuggestion = "Obesity. Eat less and do more sport!"
                resultVC.view.backgroundColor = .brown
            case (40...100):
                resultVC.labelForSuggestion = "Critical Obesity!"
                resultVC.view.backgroundColor = .red
            default:
                resultVC.labelForSuggestion = "Some index"
            }
        }
    }
    
}


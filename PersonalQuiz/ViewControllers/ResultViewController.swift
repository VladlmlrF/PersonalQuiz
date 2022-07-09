//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!

    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        getResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }

    private func getResult() {
        let animals = answersChosen.map { $0.animal }
        let numberOfAnimals = animals.reduce(into: [:]) { counts, animal in
            counts[animal, default: 0] += 1
        }
        let mostCommonAnimal = numberOfAnimals.max { $0.value < $1.value }?.key
        
        resultLabel.text = "Вы - " + String(mostCommonAnimal?.rawValue ?? " ")
        resultDefinitionLabel.text = mostCommonAnimal?.definition
    }
}

//
//  FirstViewController.swift
//  DelegateTestColorViewsAndTextField
//
//  Created by Maxim Kucherov on 12.10.2021.
//

import UIKit

protocol SettingDataDelegateProtocol {
    func sendText(_ text: String)
    func sendColor(_ color: UIColor)
}

class FirstViewController: UIViewController {

//MARK: - IB Outlets
    @IBOutlet var mainTextLabel: UILabel!
    
//MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.delegate = self
        secondVC.textFromFirstVC = mainTextLabel.text
        secondVC.colorValue = view.backgroundColor
    }
}

//MARK: - Extensions
extension FirstViewController: SettingDataDelegateProtocol {
    func sendText(_ text: String) {
        mainTextLabel.text = text
    }
    
    func sendColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

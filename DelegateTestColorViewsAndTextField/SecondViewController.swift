//
//  SecondViewController.swift
//  DelegateTestColorViewsAndTextField
//
//  Created by Maxim Kucherov on 12.10.2021.
//

import UIKit

class SecondViewController: UIViewController {

//MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    @IBOutlet var colorSlider: UISlider!
    
    @IBOutlet var mainTextField: UITextField!
    @IBOutlet var mainButton: UIButton!
    
//MARK: - Public Methods
    var colorValue: UIColor!
    
    var delegate: SettingDataDelegateProtocol!
    var textFromFirstVC: String!
        
//MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = colorValue
        
        mainTextField.text = textFromFirstVC
        setSlider()
        setColor()
    }

//MARK: - IB Actions
    @IBAction func mainButtonPressed(_ sender: UIButton) {
        guard let mainText = mainTextField.text else { return }
        delegate.sendText(mainText)
        delegate.sendColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    @IBAction func colorSliderPressed(_ sender: UISlider) {
        setColor()
    }
    
    
//MARK: - Private Methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(colorSlider.value),
            green: CGFloat(),
            blue: CGFloat(),
            alpha: 1
        )
    }
    
    private func setSlider() {
        let ciColor = CIColor(color: colorValue)
        
        colorSlider.value = Float(ciColor.red)
    }
}

//
//  ChooseCityViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 10/09/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class ChooseCityViewController: UIViewController, UIPickerViewDelegate,  UIPickerViewDataSource {
    
    var selectedCity: String = ""
    let cities: Cities = Cities()

    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        if let textFieldString = self.cityTextField.text {
            selectedCity = textFieldString
        }
        
        self.navigationItem.title = "Fitness on the Go"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextTapped))
        
        self.cityTextField.inputView = self.createPicker()
        
    }
    
    func nextTapped() {
        
        self.performSegue(withIdentifier: "showCreateSession", sender: nil)
    }
    
    func createPicker() -> UIPickerView {
        
        let picker : UIPickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 280))
        picker.delegate = self;
        return picker
    }
    
    
    // MARK: Picker Delegate
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.allCities().count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let all: Array<String> = cities.allCities()
        return all[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let all: Array<String> = cities.allCities()
        self.cityTextField.text = all[row].uppercased()
    }
    
    
}

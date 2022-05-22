//
//  ViewController.swift
//  CursoSwift
//
//  Created by Jose Muñoz on 21/5/22.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    
    private var myPickerData: [String] = ["uno", "dos", "tres"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.setTitle("mi Boton", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
    }
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myButton.setTitle(myPickerData[row], for: .normal)
    }
    
}

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
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    
    private var myPickerData: [String] = ["uno", "dos", "tres", "cuatro", "cinco", "seis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.setTitle("mi Boton", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
//        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self

        //PageControl
        myPageControl.numberOfPages = myPickerData.count
        myPageControl.currentPageIndicatorTintColor = .red
        myPageControl.pageIndicatorTintColor = .black
        
        //SegmentedControl
        mySegmentedControl.removeAllSegments()
        for (index, value) in myPickerData.enumerated() {
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        //sliders
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerData.count)
        mySlider.value = 1
        
    }
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        
    }
        
    @IBAction func mySegmentControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        switch mySlider.value {
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
        case 5..<6:
            mySegmentedControl.selectedSegmentIndex = 4
        default:
            mySegmentedControl.selectedSegmentIndex = 5
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
        
        myPageControl.currentPage = row
    }
    
}

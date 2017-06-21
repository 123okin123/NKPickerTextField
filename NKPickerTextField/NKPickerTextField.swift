//
//  PickerTextField.swift
//  PickerTextField
//
//  Created by Nikolai Kratz on 21.06.17.
//  Copyright © 2017 Nikolai Kratz. All rights reserved.
//

import UIKit

class NKPickerTextField: UITextField, UIPickerViewDataSource, UIPickerViewDelegate {
    
    /// UIPickerView of the TextField.
    private let picker = UIPickerView()
    
    /// The avalaible options of the UIPickerView associated with this TextField.
    var pickerOptions: [String]? {didSet {
        if self.text != nil {
            if self.text!.isEmpty {
                self.text = pickerOptions?[0]
            }
        }
        self.picker.reloadAllComponents()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    private func setup() {
        picker.dataSource = self
        picker.delegate = self
        self.inputView = picker
        let toolbar = UIToolbar(frame: CGRect(origin: CGPoint(x: 0, y:0), size: CGSize(width: picker.frame.size.width, height: 44)))
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        ]
        self.inputAccessoryView = toolbar
    }
    
    
    /// Called when the done Button of the inputAccessoryView is pressed. The original implementation calls the resignFirstResponder() method of the PickerTextField.
    func doneButtonPressed() {
        self.resignFirstResponder()
    }
    
    override func becomeFirstResponder() -> Bool {
        if text != nil {
            if let index = pickerOptions?.index(of: self.text!) {
                picker.selectRow(index, inComponent: 0, animated: true)
            }
        }
        return super.becomeFirstResponder()
    }
    
    //MARK: PickerViewDelegate and PickerViewDatasource
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions?.count ?? 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let option = pickerOptions?[row]
        self.text = option
    }
}

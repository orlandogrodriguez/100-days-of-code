//
//  RemindersViewController.swift
//  Swayter
//
//  Created by Orlando G. Rodriguez on 1/26/18.
//  Copyright © 2018 Worly Software. All rights reserved.
//

import UIKit

class RemindersViewController: UIViewController {
    
    var reminders: [Bool] = []
    let hours = Array(0...23)
    let minutes = Array(0...59)
    var selectedHour: Int = 9
    var selectedMinute: Int = 0
    
    
    @IBOutlet weak var dismissKeyboardButton: UIButton!
    @IBOutlet weak var reminderTimeTextField: UITextField!
    
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!
    @IBOutlet weak var sundayButton: UIButton!
    
    var dayButtons: [UIButton] = []
    var dayButtonsImagesPressed: [UIImage] = []
    var dayButtonsImagesUnpressed: [UIImage] = []
    
    @IBAction func mondayButtonPress(_ sender: UIButton) {
        dayButtonPress(index: 0)
    }
    @IBAction func tuesdayButtonPress(_ sender: UIButton) {
        dayButtonPress(index: 1)
    }
    @IBAction func wednesdayButtonPress(_ sender: UIButton) {
        dayButtonPress(index: 2)
    }
    @IBAction func thursdayButtonPress(_ sender: UIButton) {
        dayButtonPress(index: 3)
    }
    @IBAction func fridayButtonPress(_ sender: UIButton) {
        dayButtonPress(index: 4)
    }
    @IBAction func saturdayButtonPress(_ sender: UIButton) {
        dayButtonPress(index: 5)
    }
    @IBAction func sundayButtonPress(_ sender: UIButton) {
        dayButtonPress(index: 6)
    }
    
    @IBAction func dismissKeyboardButtonPress(_ sender: UIButton) {
        dismissKeyboard()
        setupKeyboardDismissalButton(isActive: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchReminders()
        createTimePicker()
        createToolBar()
        
        reminderTimeTextField.addTarget(self, action: #selector(tappedTextField), for: .touchUpInside)
        
        setupKeyboardDismissalButton(isActive: false)
    }
    
    @objc func tappedTextField(textField: UITextField) {
        print("tapped text field.")
    }
    
    func fetchReminders() {
        //To do: fetch reminders from database.
        reminders = [false, false, false, false, false, false, false]
        loadDayButtons()
    }
    
    func loadDayButtons() {
        dayButtons = [mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton]
        loadDayButtonImages()
    }
    
    func loadDayButtonImages() {
        dayButtonsImagesPressed = [#imageLiteral(resourceName: "MondayPressed"), #imageLiteral(resourceName: "TuesdayPressed"), #imageLiteral(resourceName: "WednesdayPressed"), #imageLiteral(resourceName: "ThursdayPressed"), #imageLiteral(resourceName: "FridayPressed"), #imageLiteral(resourceName: "SaturdayPressed"), #imageLiteral(resourceName: "SundayPressed")]
        dayButtonsImagesUnpressed = [#imageLiteral(resourceName: "MondayUnpressed"), #imageLiteral(resourceName: "TuesdayUnpressed"), #imageLiteral(resourceName: "WednesdayUnpressed"), #imageLiteral(resourceName: "ThursdayUnpressed"), #imageLiteral(resourceName: "FridayUnpressed"), #imageLiteral(resourceName: "SaturdayUnpressed"), #imageLiteral(resourceName: "SundayUnpressed")]
    }
    
    func updateDayButtonState(index: Int) {
        if reminders[index] {
            dayButtons[index].setBackgroundImage(dayButtonsImagesPressed[index], for: .normal)
        } else {
            dayButtons[index].setBackgroundImage(dayButtonsImagesUnpressed[index], for: .normal)
        }
    }
    
    func dayButtonPress(index: Int) {
        reminders[index] = !reminders[index]
        updateDayButtonState(index: index)
    }
    
    func createTimePicker() {
        let timePicker = UIPickerView()
        timePicker.delegate = self
        timePicker.backgroundColor = .black
        self.reminderTimeTextField.inputView = timePicker
        
    }
    
    func createToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barTintColor = .black
        toolbar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(RemindersViewController.dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        reminderTimeTextField.inputAccessoryView = toolbar
    }
    
    func setupKeyboardDismissalButton(isActive: Bool) {
        dismissKeyboardButton.isEnabled = isActive
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension RemindersViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //row = [repeatPickerView selectedRowInComponent:0];
        let row = pickerView.selectedRow(inComponent: 0)
        print("this is the pickerView \(row)")
        
        setupKeyboardDismissalButton(isActive: true)
        
        if component == 0 {
            return hours.count
        } else if component == 2 {
            return minutes.count
        } else {
            return 1
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("component: \(component)")
        print("hours: \(hours))")
        if component == 0 {
            return String(hours[row])
        } else if component == 2 {
            return String(minutes[row])
        } else {
            return ":"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            selectedHour = hours[row]
            print("Hour: \(selectedHour)")
            var oldText = reminderTimeTextField.text!
            oldText = String(oldText.dropFirst())
            oldText = String(oldText.dropFirst())
            var newText = String(format: "%02d\(oldText)", hours[row])
            reminderTimeTextField.text = newText
            print(newText)
        } else if component == 2 {
            selectedMinute = minutes[row]
            
            var oldText = reminderTimeTextField.text!
            oldText = String(oldText.dropLast())
            oldText = String(oldText.dropLast())
            var newText = String(format: "\(oldText)%02d", hours[row])
            reminderTimeTextField.text = newText
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.font = UIFont(name: "HelveticaNeue", size: 44)
        let tfX = label.frame.minX
        let tfY = label.frame.minY
        let tfW = label.frame.width
        label.frame = CGRect(x: tfX, y: tfY, width: tfW, height: 44)
        label.textColor = .white
        
        if component == 0 {
            label.textAlignment = .right
            label.text = String(format: "%02d", hours[row])
        } else if component == 2 {
            label.textAlignment = .left
            label.text = String(format: "%02d", minutes[row])
        } else {
            label.textAlignment = .center
            label.text = ":"
        }
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
}

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
    var selectedHour: Int?
    var selectedMinute: Int?
    
    @IBOutlet weak var reminderTimeButton: UIButton!
    
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
    @IBAction func reminderButtonPress(_ sender: UIButton) {
        // Show Picker View
        print("Showing time picker.")
        createTimePicker()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchReminders()

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
    }
}

extension RemindersViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //row = [repeatPickerView selectedRowInComponent:0];
        let row = pickerView.selectedRow(inComponent: 0)
        print("this is the pickerView\(row)")
        
        if component == 0 {
            return hours.count
        } else {
            return minutes.count
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if component == 0 {
            return String(hours[row])
        } else {
            return String(minutes[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            selectedHour = hours[row]
        } else {
            selectedMinute = minutes[row]
        }
        
    }
}

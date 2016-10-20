//
//  HealthFindersFiltersViewController.swift
//  Assignment1
//
//  Created by Rohun Saxena on 10/20/16.
//  Copyright © 2016 Sherman Leung. All rights reserved.
//

import UIKit

protocol HealthFinderFiltersDelegate{
    func filtersWereUpdated(gender: String, age: Int)
    
}

class HealthFindersFiltersViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    var delegate:HealthFinderFiltersDelegate?
    
    @IBOutlet var filtersView: UIView!
    @IBOutlet var agePickerView: UIPickerView!
    @IBOutlet var genderSegControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        agePickerView.delegate = self
        agePickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 65
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
        
    }
    
    
    @IBAction func filtersDidChange(_ sender: AnyObject) {
        delegate?.filtersWereUpdated(gender: genderSegControl.titleForSegment(at: genderSegControl.selectedSegmentIndex)!, age: agePickerView.selectedRow(inComponent: 0))
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        filtersDidChange(pickerView)
    }
    
    
    @IBAction func filtersViewChanged(_ sender: AnyObject) {
        if(filtersView.isHidden){
            filtersView.isHidden = false
        }else{
            filtersView.isHidden = true
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

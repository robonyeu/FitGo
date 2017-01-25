//
//  CreateSessionViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 22/09/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class CreateSessionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var horizontalSlider: UISlider!
    @IBOutlet weak var pricePerHourLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skillsCollectionView: UICollectionView!
    @IBOutlet weak var onceButton: UIButton!
    @IBOutlet weak var twoThreeButton: UIButton!
    @IBOutlet weak var fourFiveButton: UIButton!
    @IBOutlet weak var indoorButton: UIButton!
    @IBOutlet weak var outdoorButton: UIButton!
    @IBOutlet weak var dontmindButton: UIButton!
    
    var location: String = ""
    var sessionModel: CreateSessionViewModel = CreateSessionViewModel()
    var picker : UIDatePicker = UIDatePicker()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onceButton.isSelected = true
        self.indoorButton.isSelected = true
        
        registerCells()
        dateTextField.inputAccessoryView = createToolBar()
        dateTextField.inputView = createDatePicker()
    }

    func registerCells(){
        
        let nib: UINib = UINib(nibName: "SkillsCollectionViewCell", bundle: nil)
        skillsCollectionView.register(nib, forCellWithReuseIdentifier: "skillsCell")
        
        let size: CGSize = CGSize(width: 1, height: 1)
        if let flowLayout = skillsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout { flowLayout.estimatedItemSize = size }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func confirmTapped(_ sender: AnyObject) {
        
        if(sessionModel.skillsSelected.count == 0){
            let alert: UIAlertController = UIAlertController(title: "Error", message: "Please select at least one skill you want to train", preferredStyle: .alert)
            let cancel: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let value = Int(horizontalSlider.value)
            let booking: Booking = Booking(id: 1, pt_id: 2, user_id: 3, price: value, location: location, skills: sessionModel.skillsSelected, state: "Pendent", date: picker.date, trainTimesAWeek: sessionModel.timesAWeek, placeToWorkout: sessionModel.placeToWorkOut)
            
            let bookingsVC : BookingsViewController = self.navigationController?.viewControllers.first as! BookingsViewController
            bookingsVC.createBooking(booking: booking)
            
            _ = self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sessionModel.skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "skillsCell", for: indexPath) as? SkillsCollectionViewCell
        
        if (cell == nil){
            cell = SkillsCollectionViewCell()
        }
    
        let skill = sessionModel.skills[indexPath.row]
        cell?.skillNameLabel.preferredMaxLayoutWidth = 50
        cell?.skillNameLabel.text = skill
        
        if(sessionModel.skillsSelected.contains(skill)){
            cell?.skillNameLabel.textColor = .blue
        }
        else{
            cell?.skillNameLabel.textColor = .lightGray
        }
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let skill = sessionModel.skills[indexPath.row]
        
        if (sessionModel.skillsSelected.contains(skill)) {
            sessionModel.remove(object: skill)
        }
        else{
            sessionModel.skillsSelected.append(skill)
        }
        
        collectionView.reloadData()
    }
    
    @IBAction func sliderValueChanged(_ sender: AnyObject) {
   
        let value = Int(horizontalSlider.value)
        pricePerHourLabel.text = "£\(value)"
    }
  
    func donePicker()  {
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm"
        let dateString = formatter.string(from: picker.date)
        dateTextField.text = dateString
        
        dateTextField.resignFirstResponder()
    }
    
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(CreateSessionViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
    func createDatePicker() -> UIView {

        picker.datePickerMode = UIDatePickerMode.dateAndTime
        picker.backgroundColor = .white
        picker.minimumDate = Date()
    
        return picker
    }
   
    func selectTimesWeekButton(button: UIButton) {
    
        self.onceButton.isSelected = false
        self.twoThreeButton.isSelected = false
        self.fourFiveButton.isSelected = false

        button.isSelected = true
    }
    
    func selectPlacesWorkoutButton(button: UIButton) {
        
        self.indoorButton.isSelected = false
        self.outdoorButton.isSelected = false
        self.dontmindButton.isSelected = false
        
        button.isSelected = true
    }

    
    @IBAction func onceButtonTapped(_ sender: Any) {
        sessionModel.timesAWeek = (self.onceButton.titleLabel?.text)!
        selectTimesWeekButton(button: self.onceButton)
    }
    @IBAction func twothreeButtonTapped(_ sender: Any) {
        sessionModel.timesAWeek = (self.twoThreeButton.titleLabel?.text)!
        selectTimesWeekButton(button: self.twoThreeButton)
    }
    
    @IBAction func fourormoreButtonTapped(_ sender: Any) {
        sessionModel.timesAWeek = (self.fourFiveButton.titleLabel?.text)!
        selectTimesWeekButton(button: self.fourFiveButton)
    }
    
    @IBAction func indoorButtonTapped(_ sender: Any) {
        sessionModel.placeToWorkOut = (self.indoorButton.titleLabel?.text)!
        selectPlacesWorkoutButton(button: self.indoorButton)
    }
    
    @IBAction func outdoorButtonTapped(_ sender: Any) {
        sessionModel.placeToWorkOut = (self.outdoorButton.titleLabel?.text)!
        selectPlacesWorkoutButton(button: self.outdoorButton)
    }
    
    @IBAction func dontmindButtonTapped(_ sender: Any) {
        sessionModel.placeToWorkOut = (self.dontmindButton.titleLabel?.text)!
        selectPlacesWorkoutButton(button: self.dontmindButton)
    }
    
}

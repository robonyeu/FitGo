//
//  CreateSessionViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 22/09/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class CreateSessionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    @IBOutlet weak var horizontalSlider: UISlider!
    @IBOutlet weak var pricePerHourLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skillsCollectionView: UICollectionView!
    
    var location: String = ""
    var sessionModel: CreateSessionViewModel = CreateSessionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
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
            
            let booking: Booking = Booking(id: 1, pt_id: 2, user_id: 3, price: value, location: "London", skills: sessionModel.skillsSelected, state: "Pendent")
            
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
}

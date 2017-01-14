//
//  CreateSessionViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 22/09/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class CreateSessionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skillsCollectionView: UICollectionView!
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
        
        let bookingsVC : BookingsViewController = self.navigationController?.viewControllers.first as! BookingsViewController
        bookingsVC.createSessionWithStatus(status: "Pendent")
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
        
        cell?.skillNameLabel.preferredMaxLayoutWidth = 50
        cell?.skillNameLabel.text = sessionModel.skills[indexPath.row]
        
        return cell!
    }
}

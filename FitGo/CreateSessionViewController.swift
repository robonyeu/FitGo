//
//  CreateSessionViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 22/09/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class CreateSessionViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainScreenSize: CGSize = UIScreen.main.bounds.size
        let scrollableSize: CGSize = scrollView.contentSize
        scrollView.contentSize = CGSize(width: mainScreenSize.width, height: scrollableSize.height)
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
    

}

//
//  LoginViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 28/11/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitTapped(_ sender: AnyObject) {
        
        if self.isValidEmail() && self.isValidPassword() {
            self.getUser()
        }
    }
    
    @IBAction func registerTapped(_ sender: AnyObject) {
    }
    
    func isValidEmail() -> Bool{
        return true
    }
    
    func isValidPassword() -> Bool{
        return true
    }
    
    func getUser(){
        // do server connection
        
        self.performSegue(withIdentifier: "bookingsSegue", sender: self)
    }


    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    
     }
     
}

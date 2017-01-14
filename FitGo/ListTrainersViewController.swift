//
//  ListTrainersViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 28/11/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class ListTrainersViewController: UIViewController {

    @IBOutlet weak var ptTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView(){
        self.ptTableView.register(UINib(nibName:"ListTrainerTableViewCell" , bundle: nil), forCellReuseIdentifier: "trainerCell")
        self.ptTableView.estimatedRowHeight = 80.0
    }
    

    
    // MARK: - TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "trainerCell") as? ListTrainerTableViewCell
        
        if cell == nil {
            cell = ListTrainerTableViewCell(style: .default, reuseIdentifier: "trainerCell")
        }
        
        
        return cell!
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

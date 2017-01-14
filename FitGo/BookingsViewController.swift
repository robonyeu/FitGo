//
//  BookingsViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 28/11/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class BookingsViewController: UIViewController, UITableViewDataSource {

    var activeBookings : NSMutableArray? = []
    typealias booking = (String, String)
    
    @IBOutlet weak var bookingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.getActiveBookings()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView(){
        self.bookingsTableView.register(UINib(nibName:"BookingTableViewCell" , bundle: nil), forCellReuseIdentifier: "bookingCell")
        self.bookingsTableView.estimatedRowHeight = 80.0
    }
    
    func getActiveBookings(){
        
        // ask the server for active bookings
        
        if activeBookings?.count != 0 {
            self.bookingsTableView.isHidden = false
            self.bookingsTableView.reloadData()
        }
    }

    // MARK: - TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if activeBookings?.count != 0 {
            return self.activeBookings!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "bookingCell") as? BookingTableViewCell
        
        if cell == nil {
            cell = BookingTableViewCell(style: .default, reuseIdentifier: "bookingCell")
        }
        
        let abook = activeBookings?.object(at: indexPath.row)
        
        /*if abook as Dictionary {
            cell?.trainerName.text = abook[1]
        }*/
        
        return cell!
    }
    
    
    public func createSessionWithStatus(status: String){
        
       // let abooking : booking = ("Jose Machuca", status)
        let booking = [1: "Jose Machuca", 2: status]
        activeBookings?.add(booking)
//)
        
        if activeBookings?.count != 0 {
            self.bookingsTableView.isHidden = false
            self.bookingsTableView.reloadData()
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

//
//  BookingsViewController.swift
//  FitGo
//
//  Created by Joan Cardona on 28/11/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class BookingsViewController: UIViewController, UITableViewDataSource {

    var activeBookings: Array<Booking> = Array<Booking>()
    
    @IBOutlet weak var bookingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.getActiveBookings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView(){
        self.bookingsTableView.register(UINib(nibName:"BookingTableViewCell" , bundle: nil), forCellReuseIdentifier: "bookingCell")
        self.bookingsTableView.estimatedRowHeight = 80.0
    }
    
    func getActiveBookings(){
        
        // ask the server for active bookings
        
        if activeBookings.count != 0 {
            self.bookingsTableView.isHidden = false
            self.bookingsTableView.reloadData()
        }
    }

    // MARK: - TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if activeBookings.count != 0 {
            return self.activeBookings.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "bookingCell") as? BookingTableViewCell
        
        if cell == nil {
            cell = BookingTableViewCell(style: .default, reuseIdentifier: "bookingCell")
        }
        
        let booking: Booking = activeBookings[indexPath.row]
        
        cell?.statusLabel.text = booking.state
        cell?.locationLabel.text = booking.location
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "HH:mm dd/MM/YYYY"
        
        cell?.classDate.text = formatter.string(from: booking.date)
        
        return cell!
    }
    
    public func createBooking(booking: Booking){
        
        activeBookings.append(booking)

        if activeBookings.count != 0 {
            self.bookingsTableView.isHidden = false
            self.bookingsTableView.reloadData()
        }
    }

}

//
//  Booking.swift
//  FitGo
//
//  Created by Joan Cardona on 14/01/17.
//  Copyright © 2017 JoanCardona. All rights reserved.
//

import Foundation

class Booking{
    
    var id: Int = 0
    var pt_id: Int = 0
    var user_id: Int = 0
    var price: Int = 0
    var location: String = ""
    var skills: Array<String> = Array<String>()
    var state: String = ""
    var date: Date = Date()
    var trainTimesAWeek: String = ""
    var placeToWorkout: String = ""
    
    
    init(id: Int, pt_id: Int, user_id: Int, price: Int, location: String, skills: Array<String>, state: String, date: Date, trainTimesAWeek: String, placeToWorkout: String){
        self.id = id
        self.pt_id = pt_id
        self.user_id = user_id
        self.price = price
        self.location = location
        self.skills = skills
        self.state = state
        self.date = date
        self.trainTimesAWeek = trainTimesAWeek
        self.placeToWorkout = placeToWorkout
    }
    
}

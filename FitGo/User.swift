//
//  User.swift
//  FitGo
//
//  Created by Joan Cardona on 28/11/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//


/*
 **
    This has to be a MTLModel
 **
*/


import UIKit

class User: NSObject {

    let name, lastname, birthday : String
    var email: String
    var phoneNumber: Int
    var bookings: Array<Booking> = []
    
    init(userName: String, lastname: String, birthday: String, email: String, phoneNumber: Int) {
        self.name = userName;
        self.lastname = lastname
        self.birthday = birthday
        self.email = email
        self.phoneNumber = phoneNumber
    }
    
    func user () -> User{
        return self
    }
    
}

extension User{
    
    func fullName() -> String {
        return name + " " + lastname
    }
    
}

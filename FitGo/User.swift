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

    let name, surname : String
    
    init(userName: String, userSurname: String) {
        self.name = userName;
        self.surname = userSurname
    }
    
   
    /*
    convenience init(userName: String, userSurname: String, actualCity: Cities){
        
        self.init(userName: userName)
    //    name = userName
            //  surname
    }
    */
    
    func user () -> User{
        return self
    }
    
    
}

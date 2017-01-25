//
//  CreateSessionViewModel.swift
//  FitGo
//
//  Created by Joan Cardona on 28/11/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class CreateSessionViewModel: NSObject {

    let skills:  Array = ["Boxing", "Yoga", "Loose weight", "Spinning", "Crossfit", "Nutrition", "Boxing", "Yoga", "Loose weight", "Spinning", "Crossfit"]
    var skillsSelected: Array = Array<String>()
    var timesAWeek = "Once"
    var placeToWorkOut = "Indoor"
    
    func remove(object: String) {
        if let index = skillsSelected.index(of: object){
            skillsSelected.remove(at: index)
        }
    }
}


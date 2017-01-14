//
//  Cities.swift
//  FitGo
//
//  Created by Joan Cardona on 10/09/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

struct Cities {

    let availableCities: Array = ["london", "manchester"]
    
    func isValid(_ city: String) -> Bool{
        return availableCities.contains(city.lowercased())
    }
    
    func allCities() -> Array<String> {
        return availableCities
    }
    
    
}

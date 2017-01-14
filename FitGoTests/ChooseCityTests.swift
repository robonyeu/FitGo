//
//  ChooseCityTests.swift
//  FitGo
//
//  Created by Joan Cardona on 10/09/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import XCTest
@testable import FitGo

class ChooseCityTests: XCTestCase {
    
    let chooseCityVC = ChooseCityViewController()
    let cities = Cities()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCityIsNotEmpty() {
        let chosenCity: String = chooseCityVC.selectedCity
        XCTAssertNotNil(chosenCity, "\(chosenCity) is empty")
    }
    
    
    func testCityIsAValidCity(){
     //   chooseCityVC.cityTextField.text = "LONDON"
        let chosenCity: String = chooseCityVC.selectedCity
        XCTAssertTrue(cities.isValid(chosenCity), "\(chosenCity) is not valid")
    }
    
    func testListCities(){
        XCTAssertNotNil(cities.availableCities, "array is not init")
    }
    
    func testUserLocation(){
        
    }
    
    func testPicker() {

        
    }
}

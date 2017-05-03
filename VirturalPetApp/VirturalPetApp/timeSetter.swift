//
//  timeSetter.swift
//  VirturalPetApp
//
//  Created by Jonathan Turnbull on 3/05/2017.
//  Copyright © 2017 partywolfAPPS. All rights reserved.
//

import UIKit

class timeSetter {
    
    let currentDateTime : Date
    let calendar: Calendar
    //let hours: DateComponents
    //let minutes: DateComponents
    //let seconds: DateComponents
    
    
    init(currentDateTime: Date, calendar: Calendar) {
        self.currentDateTime = currentDateTime
        self.calendar = Calendar.current
        //self.hours = calendar.component(.hour, from: currentDateTime)
    }
}

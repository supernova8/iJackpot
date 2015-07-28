//
//  Tickets.swift
//  iJackpot
//
//  Created by Sonova Middleton on 7/8/15.
//  Copyright (c) 2015 supernova8productions. All rights reserved.
//

import UIKit
import Parse

class Tickets: PFObject, PFSubclassing {
    
    
    @NSManaged var ticketNumber1: String
    @NSManaged var ticketNumber2: String
    @NSManaged var ticketNumber3: String
    @NSManaged var ticketNumber4: String
    @NSManaged var ticketNumber5: String
    
    @NSManaged var powerBallNumber: String
    
    @NSManaged var dateWon: NSDate
    @NSManaged var winStatus: Bool
    @NSManaged var winAmount: String
    
    
    
    
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Tickets"
    }

   
}

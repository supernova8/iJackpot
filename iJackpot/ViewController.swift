//
//  ViewController.swift
//  iJackpot
//
//  Created by Sonova Middleton on 7/8/15.
//  Copyright (c) 2015 supernova8productions. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ticketsArray = [Tickets]()
    //@IBOutlet var ticketLabel :UILabel!
    //@IBOutlet var winLabel : UILabel!
    
    @IBOutlet var ticketsTableView :UITableView!
    
    //MARK: - Number Generation Methods
    
    func createTicketArray(n:Int ) -> [Int] {
        
        //var ticketPoolArray = ["1" : "1", ]
        
        
            var poolArray:[Int] = []
            for i in 1..<n {
                //ticketPoolArray.append(Int(arc4random_uniform(20) + 1))
                poolArray.append(Int(i))
            }
          return poolArray
        
        
        
        //makeList(5)  // [10, 11, 13, 18, 20]
        
    }
    
     func generateTickets(sender: UIButton) {
        
        var ticketPoolArray:[Int] = createTicketArray(76)
    
    
        var thisTicketArray:[Int] = []
        
        var fiveNum = 1
        while fiveNum < 6
        {
                //createTicketArray(5)  // [10, 11, 13, 18, 20]
                //println("Ticket Pool: \(ticketPoolArray)")
        
                // for loop
        
                let randomNum = Int(arc4random_uniform(UInt32(ticketPoolArray.count)))
        
                var xAppears = false
        
                for number in ticketPoolArray {
                        if (number == randomNum) && (number != 0) {
                                xAppears = true
                        }
                }
        
                if xAppears {
                        println("yes")
                        thisTicketArray.append(Int(randomNum))
                        ticketPoolArray[randomNum - 1] = 0
                        ++fiveNum
                    } else {
                        println("no")
                }
        
        
                //ticketPoolArray.removeAtIndex(5)
        
                //println("Ticket Pool (Removed : \(randomNum)): \(ticketPoolArray)")
        
        }
        
        //let randomNum = Int(arc4random_uniform(UInt32(75)))
        
        //println("Random Number: \(randomNum)")
        
        //let currentIndex = Int(arc4random_uniform(UInt32(ballArray.count)))
        println("Your Ticket: \(thisTicketArray)")
        
        //Generate PowerBall
        
        var powerBallPoolArray:[Int] = createTicketArray(16)
        
        //var thispowerBallArray:[Int] = []
        
        
            //println("Power Ball Pool: \(powerBallPoolArray)")
            
            // for loop
            var oneNum = 1
             while (oneNum != 0) {
            let randomNum = Int(arc4random_uniform(UInt32(powerBallPoolArray.count)))
            //println("PowerBall Pool (Removed : \(randomNum)")
            var xpbAppears = false
        
       
            for number in powerBallPoolArray {
                if number == randomNum {
                    xpbAppears = true
                }
            }
            
            if xpbAppears {
                println("yes")
                thisTicketArray.append(Int(randomNum))
                powerBallPoolArray[randomNum - 1] = 0
                --oneNum
            } else {
                println("no")
            }
            //println("Ticket Pool (Removed : \(randomNum)): \(powerBallPoolArray)")
        }
            //ticketPoolArray.removeAtIndex(5)
            
            //println("Ticket Pool (Removed : \(randomNum)): \(powerBallPoolArray)")
            
        
        
        //let randomNum = Int(arc4random_uniform(UInt32(75)))
        
        //println("Random Number: \(randomNum)")
        
        //let currentIndex = Int(arc4random_uniform(UInt32(ballArray.count)))
        //println("Your PowerBall: \(thispowerBallArray)")
        println("Your Ticket + Power Ball: \(thisTicketArray)")
        
        let ticket = Tickets()
        ticket.ticketNumber1 = "\(thisTicketArray[0])"
        ticket.ticketNumber2 = "\(thisTicketArray[1])"
        ticket.ticketNumber3 = "\(thisTicketArray[2])"
        ticket.ticketNumber4 = "\(thisTicketArray[3])"
        ticket.ticketNumber5 = "\(thisTicketArray[4])"
        ticket.powerBallNumber = "\(thisTicketArray[5])"
        //ticket.dateWon = NSDate()
        ticket.winStatus = false
        ticket.winAmount = ""

        ticket.saveInBackgroundWithBlock({(success: Bool, error: NSError?) -> Void in
            if success {
                println("Success")
                self.fetchTickets()
                self.ticketsTableView.reloadData()
            } else {
                println("Fail")
            }
            
        })
        fetchTickets()
        self.ticketsTableView.reloadData()
        
}



    func generateWinningTicket(sender: UIButton) {
        
        var ticketPoolArray:[Int] = createTicketArray(76)
        
        
        var thisTicketArray:[Int] = []
        
        var fiveNum = 1
        while fiveNum < 6
        {
            //createTicketArray(5)  // [10, 11, 13, 18, 20]
            //println("Ticket Pool: \(ticketPoolArray)")
            
            // for loop
            
            let randomNum = Int(arc4random_uniform(UInt32(ticketPoolArray.count)))
            
            var xAppears = false
            
            for number in ticketPoolArray {
                if (number == randomNum) && (number != 0) {
                    xAppears = true
                }
            }
            
            if xAppears {
                println("yes")
                thisTicketArray.append(Int(randomNum))
                ticketPoolArray[randomNum - 1] = 0
                ++fiveNum
            } else {
                println("no")
            }
            
            
            //ticketPoolArray.removeAtIndex(5)
            
            //println("Ticket Pool (Removed : \(randomNum)): \(ticketPoolArray)")
            
        }
        
        //let randomNum = Int(arc4random_uniform(UInt32(75)))
        
        //println("Random Number: \(randomNum)")
        
        //let currentIndex = Int(arc4random_uniform(UInt32(ballArray.count)))
        println("Your Ticket: \(thisTicketArray)")
        
        //Generate PowerBall
        
        var powerBallPoolArray:[Int] = createTicketArray(16)
        
        //var thispowerBallArray:[Int] = []
        
        
        //println("Power Ball Pool: \(powerBallPoolArray)")
        
        // for loop
        var oneNum = 1
        while (oneNum != 0) {
            let randomNum = Int(arc4random_uniform(UInt32(powerBallPoolArray.count)))
            println("PowerBall Pool (Removed : \(randomNum))")
            var xpbAppears = false
            
            
            for number in powerBallPoolArray {
                if number == randomNum {
                    xpbAppears = true
                }
            }
            
            if xpbAppears {
                println("yes")
                thisTicketArray.append(Int(randomNum))
                powerBallPoolArray[randomNum - 1] = 0
                --oneNum
            } else {
                println("no")
            }
            //println("Ticket Pool (Removed : \(randomNum)): \(powerBallPoolArray)")
        }
        //ticketPoolArray.removeAtIndex(5)
        
        //println("Ticket Pool (Removed : \(randomNum)): \(powerBallPoolArray)")
        
        
        
        //let randomNum = Int(arc4random_uniform(UInt32(75)))
        
        //println("Random Number: \(randomNum)")
        
        //let currentIndex = Int(arc4random_uniform(UInt32(ballArray.count)))
        //println("Your PowerBall: \(thispowerBallArray)")
        println("Your WINNING Ticket + Power Ball: \(thisTicketArray)")
        
        //return thisTicketArray
        
//        let ticket = Tickets()
//        ticket.ticketNumber1 = "\(thisTicketArray[0])"
//        ticket.ticketNumber2 = "\(thisTicketArray[1])"
//        ticket.ticketNumber3 = "\(thisTicketArray[2])"
//        ticket.ticketNumber4 = "\(thisTicketArray[3])"
//        ticket.ticketNumber5 = "\(thisTicketArray[4])"
//        ticket.powerBallNumber = "\(thisTicketArray[5])"
//        //ticket.dateWon = NSDate()
//        ticket.winStatus = false
//        ticket.winAmount = ""
        
//        ticket.saveInBackgroundWithBlock({(success: Bool, error: NSError?) -> Void in
//            if success {
//                println("Success")
//                self.fetchTickets()
//                self.ticketsTableView.reloadData()
//            } else {
//                println("Fail")
//            }
//            
//        })
        //        fetchTickets()
        //        self.ticketsTableView.reloadData()
        
        playTapped(thisTicketArray)
        //        fetchTickets()
        self.ticketsTableView.reloadData()

    }

    
    
    
    // 4
    func addTapped(sender:UIButton) {
        println("add pressed")
    }
    // 5
    func playTapped (winnerArray:[Int]) {
        
        
        println("play pressed")
        
        var ticketWinCount = 0
        var pbWinCount = 0
        
        //var pbWinner = winnerArray[5]
       //winnerArray.removeLast()
        
           // .removeAtIndex(5)
        
        for (var i=0;i < ticketsArray.count; i++) {
        
            let currentTicket = ticketsArray[i]
            
            for (var j=0; j < winnerArray.count - 1; j++) {
            
          
                if(winnerArray[j] == currentTicket.ticketNumber1.toInt()) {
                    println("winner: \(winnerArray[j])")
                    ++ticketWinCount;
                } else if(winnerArray[j] == currentTicket.ticketNumber2.toInt()) {
                    println("winner: \(winnerArray[j])")
                    ++ticketWinCount;
                } else if(winnerArray[j] == currentTicket.ticketNumber3.toInt()) {
                    println("winner: \(winnerArray[j])")
                    ++ticketWinCount;
                } else if(winnerArray[j] == currentTicket.ticketNumber4.toInt()) {
                    println("winner: \(winnerArray[j])")
                    ++ticketWinCount;
                } else if (winnerArray[j] == currentTicket.ticketNumber5.toInt()) {
                    println("winner: \(winnerArray[j])")
                    ++ticketWinCount;
                } else {
                    println("No winner")
                }
            } // end for j

                if (winnerArray[5] == currentTicket.powerBallNumber.toInt()) {
                    println("PB Winner: \(winnerArray[5])")
                    ++pbWinCount
                }
                
            //Winner prize logic
            
            let winnerSquare = (ticketWinCount,pbWinCount) //middle square
            println("Winner Square: \(winnerSquare)")
            
            switch winnerSquare {
            case (0,0):
                println("Loser Ticket. Girl, bye!")
                currentTicket.winStatus = false
                
            case (0,1):
                println("$1.00")
                currentTicket.winStatus = true
                currentTicket.winAmount = "$1.00"
            case (1,1):
                println("$2.00")
                currentTicket.winStatus = true
                currentTicket.winAmount = "$2.00"
            case (3,0):
                println("$5.00")
                currentTicket.winStatus = true
                currentTicket.winAmount = "$5.00"
            case (2,1):
                println("$5.00")
                currentTicket.winStatus = true
                currentTicket.winAmount = "$5.00"
            case (3,1):
                println("$50.00")
                currentTicket.winStatus = true
                currentTicket.winAmount = "$50.00"
            case (4,0):
                println("$500.00")
                currentTicket.winStatus = true
                currentTicket.winAmount = "$500.00"
            case (4,1):
                println("$5,000.00")
                currentTicket.winStatus = true
                currentTicket.winAmount = "$5,000.00"
            case (5,0):
                println("$1 Million")
                currentTicket.winStatus = true
                currentTicket.winAmount = "$1 Million"
            case (5,1):
                println("JACKPOT!!")
                currentTicket.winStatus = true
                currentTicket.winAmount = "JACKPOT!!"
            default:
                println("Default")
            } //end switch

            
            currentTicket.saveInBackground()
            println("Save Ticket")
            ticketWinCount = 0
            pbWinCount = 0
            } //end for i
        
        
        
        
        
        } // end function
        


    func undoTapped (sender:UIButton) {
        println("undo pressed")
        
        for (var i=0;i < ticketsArray.count; i++) {
            
            let currentTicket = ticketsArray[i]
            currentTicket.winStatus = false
            currentTicket.winAmount = ""
            currentTicket.saveInBackground()
            
        }
        
        fetchTickets()
        self.ticketsTableView.reloadData()
        
    }

    
    
    // MARK: - Core Methods
    
    func fetchTickets() {
        
        var ticketQuery = PFQuery(className: "Tickets")
        ticketQuery.addDescendingOrder("createdAt")
        ticketQuery.findObjectsInBackgroundWithBlock{ (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                println("Successfully got \(objects!.count) tickets")
                if let objects = objects as? [Tickets]{
                    self.ticketsArray = objects
                    println("Tickets Count: \(self.ticketsArray.count)")
                    
                     self.ticketsTableView.reloadData()
                    //println("\(self.ticketsArray)")
                    
                }
            } else {
                println("Error At Server")
                
            }
        }
    }

    
    func tempTickets() {
        
        let ticket = Tickets()
        ticket.ticketNumber1 = "12"
        ticket.ticketNumber2 = "21"
        ticket.ticketNumber3 = "33"
        ticket.ticketNumber4 = "42"
        ticket.ticketNumber5 = "65"
        ticket.powerBallNumber = "5"
        ticket.dateWon = NSDate()
        ticket.winStatus = false
        ticket.winAmount = ""
        
        
        let ticket1 = Tickets()
        ticket1.ticketNumber1 = "12"
        ticket1.ticketNumber2 = "21"
        ticket1.ticketNumber3 = "33"
        ticket1.ticketNumber4 = "42"
        ticket1.ticketNumber5 = "65"
        ticket1.powerBallNumber = "5"
        ticket1.dateWon = NSDate()
        ticket1.winStatus = true
        ticket1.winAmount = "$1"

        
        let ticket2 = Tickets()
        ticket2.ticketNumber1 = "12"
        ticket2.ticketNumber2 = "21"
        ticket2.ticketNumber3 = "33"
        ticket2.ticketNumber4 = "42"
        ticket2.ticketNumber5 = "65"
        ticket2.powerBallNumber = "5"
        ticket2.dateWon = NSDate()
        ticket2.winStatus = false
        ticket2.winAmount = ""
        
        let ticket3 = Tickets()
        ticket3.ticketNumber1 = "12"
        ticket3.ticketNumber2 = "21"
        ticket3.ticketNumber3 = "33"
        ticket3.ticketNumber4 = "42"
        ticket3.ticketNumber5 = "65"
        ticket3.powerBallNumber = "5"
        ticket3.dateWon = NSDate()
        ticket3.winStatus = true
        ticket3.winAmount = "$1"

        
        ticketsArray.append(ticket)
        ticketsArray.append(ticket1)
        ticketsArray.append(ticket2)
        ticketsArray.append(ticket3)
        
        
//        ticket.saveInBackgroundWithBlock({(success: Bool, error: NSError?) -> Void in
//            if success {
//                println("Success")
//                
//            } else {
//                println("Fail")
//            }
//            
//        })

        
    }

    //MARK: - TableView Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //println("Ticket List Count: \(ticketsArray.count)")
        return self.ticketsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier:"cell")
        let currentTicket = ticketsArray[indexPath.row]
        
        
        cell.textLabel!.text = "Numbers: \(currentTicket.ticketNumber1), \(currentTicket.ticketNumber2), \(currentTicket.ticketNumber3), \(currentTicket.ticketNumber4), \(currentTicket.ticketNumber5) Mega Ball: \(currentTicket.powerBallNumber)"
        cell.textLabel!.textColor = UIColor.grayColor()
        cell.textLabel!.font = UIFont.systemFontOfSize(11.0)
        
        if(currentTicket.winStatus) {
            
        cell.detailTextLabel!.text = "\(currentTicket.winAmount)"
        cell.detailTextLabel!.textColor = UIColor.redColor()
        cell.detailTextLabel!.font = UIFont.systemFontOfSize(11.0)
        }
        
        return cell
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        performSegueWithIdentifier("editToDetailSegue", sender: self)
//        
//    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        ticketsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
         //fetchTickets()
           // 1
        var rightPlayBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "generateWinningTicket:")
        // 2
        var rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "generateTickets:")
        // 3
        var rightUndoBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Undo", style: UIBarButtonItemStyle.Plain, target: self, action: "undoTapped:")
        
        self.navigationItem.setRightBarButtonItems([rightPlayBarButtonItem,rightAddBarButtonItem,rightUndoBarButtonItem ], animated: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchTickets()
        //tempTickets()
        //ticketsTableView.reloadData()
        
        //generateTickets()
        
//        var ticketPoolArray:[Int] = createTicketArray(76)
//       //createTicketArray(5)  // [10, 11, 13, 18, 20]
//        println("Ticket Pool: \(ticketPoolArray)")
//        
//        ticketPoolArray.removeAtIndex(5)
//        
//        println("Ticket Pool (Remove #6): \(ticketPoolArray)")
        
        //ticketsArray = = ["1" : "Sunday", "2" : "Monday"]
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


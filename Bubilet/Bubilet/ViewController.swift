//
//  ViewController.swift
//  Bubilet
//
//  Created by Hilal Akgül on 15.02.2022.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let notification: NotificationCenter = .default

    static var from = String()
    static var to = String()
    static var pnrfrom = Int()
    static var pnrto = Int()
    static var date = String()
    
    static var tickets = [TicketModel]()
    var reservationDict: [Int: [String]] = [:]
    var soldSeats = [String]()
    var soldPnr = Int()
    var reservSeats = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        notification.addObserver(self, selector: #selector(getFrom), name: .notificationA, object: nil)

        // Do any additional setup after loading the view.

    }
    
    @IBAction func fromButton(_ sender: Any) {
        self.performSegue(withIdentifier: "FROM", sender: self)
    }
    @IBAction func toButton(_ sender: Any) {
        self.performSegue(withIdentifier: "TO", sender: self)
    }
    @IBAction func dateSelected(_ : AnyObject){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let date :[String: String] = ["DATE" : ViewController.date]
        NotificationCenter.default.post(name: .notificationD, object: nil,userInfo: date)
        ViewController.date = formatter.string(from: datePicker.date)
        
        print(ViewController.date,ViewController.from,ViewController.to,ViewController.pnrfrom,ViewController.pnrto)
        
    }
    
    @objc func getFrom(_ notification : NSNotification){
        if let dict = notification.userInfo as? NSDictionary {
            if let from = dict["FROM"] as? String{
                ViewController.from = from
            }
            if let to = dict["TO"] as? String{
                ViewController.to = to
            }
            if let tickets = dict["tickets"] as? [TicketModel]{
                ViewController.tickets = tickets
            }
            if let pnrFrom = dict["PNRFrom"] as? Int{
                ViewController.pnrfrom = pnrFrom
            }
            if let pnrTo = dict["PNRTo"] as? Int{
                ViewController.pnrto = pnrTo
            }
            
            
          }
        
    }

    @IBAction func showTickets(_ sender: Any) {
        self.performSegue(withIdentifier: "showTicketList", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "FROM"){
                let displayVC = segue.destination as! FromToWhereViewController
            displayVC.number = 0

        }
        if(segue.identifier == "TO"){
            let displayVC = segue.destination as! FromToWhereViewController
            displayVC.number = 1
        }
        if(segue.identifier == "showTicketList"){
            let displayVC = segue.destination as! TicketListViewController
            displayVC.tickets = ViewController.tickets
            displayVC.reservationDict = reservationDict
            displayVC.soldPnr = soldPnr
            displayVC.soldSeats = soldSeats
            displayVC.reservSeats = PrintTicketViewController.takenSeats
            displayVC.pnrfrom = ViewController.pnrfrom
            displayVC.pnrto = ViewController.pnrto

        }

    }


}

extension Notification.Name{
    static let notificationA = Notification.Name(rawValue: "NotificationA")

    
}

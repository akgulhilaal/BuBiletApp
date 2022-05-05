//
//  PrintTicketViewController.swift
//  Bubilet
//
//  Created by Hilal Akgül on 21.02.2022.
//

import UIKit



class PrintTicketViewController: UIViewController{
    
    let notification: NotificationCenter = .default

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var whereLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var seatNumbersLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pnrLabel: UILabel!
    
    
    var name = ""
    var surname = ""
    var id = ""
    
    
    var seats = [String]()
    var price = Int()
    var ticket = TicketModel()
    static var dateString = String()
    
    
    var seatModel = [SeatDetail]()
    var reservationDict: [Int: [String]] = [:]
    static var takenSeats = [String]()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notification.addObserver(self, selector: #selector(getDate), name: .notificationD, object: nil)

        nameLabel.text = name
        surnameLabel.text = surname
        idLabel.text = id
        priceLabel.text = "\(price) ₺"
        seatNumbersLabel.text = " Koltuklar: \(seats.joined(separator: ","))"
        fromLabel.text = ticket.locationFrom
        whereLabel.text = ticket.locationTo
        dateLabel.text = PrintTicketViewController.dateString
        timeLabel.text = ticket.time
        pnrLabel.text = "PNR: \(ticket.pnr)"

        
        PrintTicketViewController.takenSeats = seats + PrintTicketViewController.takenSeats
        print(PrintTicketViewController.takenSeats)
        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
    }
    @objc func getDate(_ notification : NSNotification){
        if let dict = notification.userInfo as? NSDictionary {
            if let date = dict["DATE"] as? String{
                PrintTicketViewController.dateString = date
            }
          }
        
    }
    

    @IBAction func backMain(_ sender: Any) {
        self.performSegue(withIdentifier: "InputVCToDisplayVC", sender: self)
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false


//        reservation.append(ReservationModel(id: id, name: name, surname: surname, fromlocation: ticket.locationFrom, tolocation: ticket.locationTo, price: price, date: ticket.date, time: ticket.time, seats: seats, pnr: ticket.pnr))
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "InputVCToDisplayVC"){
                let displayVC = segue.destination as! ViewController
            displayVC.modalPresentationStyle = .fullScreen
            reservationDict[ticket.pnr] = PrintTicketViewController.takenSeats
            displayVC.reservationDict = reservationDict
            displayVC.soldPnr = ticket.pnr
            displayVC.soldSeats = seats
            displayVC.reservSeats = PrintTicketViewController.takenSeats


        }
    }

}
extension Notification.Name{
    static let notificationD = Notification.Name(rawValue: "NotificationD")

    
}

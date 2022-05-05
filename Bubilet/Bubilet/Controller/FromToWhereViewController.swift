//
//  FromToWhereViewController.swift
//  Bubilet
//
//  Created by Hilal Akgül on 24.02.2022.
//

import UIKit

class FromToWhereViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var tickets = [TicketModel]()
    var soldSeats = [String]()
    var number = Int()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tickets.append(TicketModel(date: "", time: "10:00", locationfrom: "Istanbul", locationto: "Van", logo: "metro", price: 300 , pnr: 1,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "11:00", locationfrom: "Ankara",locationto: "Kocaeli", logo: "ulusoy", price: 250, pnr: 2 ,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "12:00", locationfrom: "Samsun",locationto: "Giresun", logo: "metro", price: 175, pnr: 3,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "13:00", locationfrom: "Ordu",locationto: "Elazığ", logo: "varan", price: 150, pnr: 4,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "14:00", locationfrom: "İzmir",locationto: "Mardin", logo: "metro", price: 450, pnr: 5,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "15:00", locationfrom: "Antalya",locationto: "Edirne", logo: "varan", price: 230, pnr: 6,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "16:00", locationfrom: "Eskişehir",locationto: "Kayseri", logo: "ulusoy", price: 320, pnr: 7,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "17:00", locationfrom: "Bursa",locationto: "Konya", logo: "varan", price: 210, pnr: 8,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "18:00", locationfrom: "Adana",locationto: "Hatay", logo: "varan", price: 75, pnr: 9,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "19:00", locationfrom: "Balıkesir",locationto: "Sivas", logo: "ulusoy", price: 245, pnr: 10,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "20:00", locationfrom: "Erzurum",locationto: "Sinop", logo: "ulusoy", price: 265, pnr: 11,soldSeats: soldSeats))
        tickets.append(TicketModel(date: "", time: "21:00", locationfrom: "Aydın", locationto: "Manisa",logo: "metro", price: 100, pnr: 12,soldSeats: soldSeats))

        // Do any additional setup after loading the view.
    }


}
extension FromToWhereViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tickets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        if number == 0{
            cell.textLabel?.text = tickets[indexPath.row].locationFrom
        }
        else {
            cell.textLabel?.text = tickets[indexPath.row].locationTo
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if number == 0{
            let from :[String: String] = ["FROM" : tickets[indexPath.row].locationFrom]
            let pnr :[String: Int] = ["PNRFrom" : tickets[indexPath.row].pnr]
            let tickets :[String: [TicketModel]] = ["tickets" : tickets]
            NotificationCenter.default.post(name: .notificationA, object: nil,userInfo: from)
            NotificationCenter.default.post(name: .notificationA, object: nil,userInfo: tickets)
            NotificationCenter.default.post(name: .notificationA, object: nil,userInfo: pnr)
            
        }
        else{
            let to :[String: String] = ["TO" :tickets[indexPath.row].locationTo]
            let pnr :[String: Int] = ["PNRTo" : tickets[indexPath.row].pnr]
            NotificationCenter.default.post(name: .notificationA, object: nil,userInfo: to)
            NotificationCenter.default.post(name: .notificationA, object: nil,userInfo: pnr)
        }
        
        self.dismiss(animated: true, completion: nil)
        

    }


}


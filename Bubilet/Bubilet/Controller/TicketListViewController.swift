//
//  TicketListViewController.swift
//  Bubilet
//
//  Created by Hilal Akgül on 15.02.2022.
//

import UIKit

class TicketListViewController: UIViewController{

     @IBOutlet weak var TicketListTable: UITableView!
     var tickets = [TicketModel]()
    var reservationDict: [Int: [String]] = [:]
    var soldSeats = [String]()
    var soldPnr = Int()
    var reservSeats = [String]()
    public var pnrfrom = Int()
    public var pnrto = Int()

     override func viewDidLoad() {
         super.viewDidLoad()

         TicketListTable.register(UINib(nibName: "TicketListTableViewCell", bundle: nil), forCellReuseIdentifier: "TicketCell")


     }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
     func didTapTicket(for ticket : TicketModel) {
             
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
         if let controller = storyBoard.instantiateViewController(withIdentifier: "TicketDetailController") as? TicketDetailController {
             controller.ticket = ticket
             controller.reservationDict = reservationDict
             controller.reservSeats = reservSeats

             controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
            } else {
                print("Controller not found")
            }
         
         
     }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "dataTransfer"){
            let secondScreen = segue.destination as! PrintTicketViewController
            secondScreen.seats = soldSeats
            PrintTicketViewController.takenSeats = reservSeats
            

        }
    }


 }
 extension TicketListViewController : UITableViewDataSource, UITableViewDelegate{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         tickets.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath) as! TicketListTableViewCell
         cell.configure(model: tickets[indexPath.row])
         cell.didTapTicket = self.didTapTicket
         cell.LocationFromLabel.text = ViewController.from
         cell.LocationToLabel.text = ViewController.to
         cell.DateLabel.text = ViewController.date
         
         return cell
     }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("\(indexPath.row + 1 ) nolu satıra tıkladım")
         

     }


 }

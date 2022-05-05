//
//  TicketDetailController.swift
//  Bubilet
//
//  Created by Hilal Akgül on 15.02.2022.
//

import UIKit

class TicketDetailController: UIViewController {
    
    
     @IBOutlet weak var collectionView: UICollectionView!
     @IBOutlet weak var selectedSeats: UILabel!
     @IBOutlet weak var priceLabel: UILabel!

     @IBOutlet weak var back: UIButton!
    
     
     var seat = [SeatDetail]()
     var pathWayNumber = Int()
     var seatNumber = Int()
     var ticket : TicketModel?
     var seatNo = [String]()
    var reservationDict: [Int: [String]] = [:]
    var reservSeats = [String]()

     
     override func viewDidLoad() {
         super.viewDidLoad()
         print(ticket!.locationFrom)
         print(ticket!.soldSeats)

         seatNumber = 0
         priceLabel.numberOfLines = 0

         for i in 1...45{
             switch i {
             case 2,5,8,11,14,17,20,23,26,29,32,35,38,41,44:
                 seat.append(SeatDetail(seatNo: "", seatCondition: 0))
                 seat.append(SeatDetail(seatNo: "\(i)", seatCondition: 0))
                 seatNumber += 1
             default:
                 seat.append(SeatDetail(seatNo: "\(i)", seatCondition: 0))

             }
             
         }

         collectionView.register(UINib(nibName: "SeatPlanCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeatCell")
     }

     @IBAction func back(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)

     }
    
     func addSeat(seatno: String){
         if !seatNo.contains(seatno) {
             seatNo.append(seatno)
         }
         else {
             if let index = seatNo.firstIndex(of: seatno) {
                 seatNo.remove(at: index)
             }
         }
     }
    
     func createAlert (title : String ){
         var dialogMessage = UIAlertController(title: title, message: "", preferredStyle: .alert)

         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
          })

         dialogMessage.addAction(ok)

         self.present(dialogMessage, animated: true, completion: nil)
     }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let secondViewController = segue.destination as! PassengerDetailsViewController

         secondViewController.seats = seatNo
         secondViewController.totalPrice = seatNo.count*ticket!.price
         secondViewController.ticket = ticket!
         
     }


 }
extension TicketDetailController : UICollectionViewDelegate , UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        seat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatCell", for: indexPath) as! SeatPlanCollectionViewCell
        cell.configure(model: seat[indexPath.row])
        let text = seat[indexPath.row].seatNo
        var condition = seat[indexPath.row].seatCondition
        let pnr = ticket!.pnr
        let reservatedPnr = reservationDict.keys
        let reservatedSeats = Array(reservationDict.values)
        

        if reservatedPnr.contains(pnr){
            for i in reservatedSeats{
                
                for k in i{
                    if text == k {
                        condition = 1
                        
                    }
                }
            }
        }

        if text == "" {
            cell.backgroundColor = nil
        }else {
            if condition == 1 {
                cell.backgroundColor = .green
            } else {
                cell.backgroundColor = .gray
            }
            
        }
        
          
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let cell = collectionView.cellForItem(at: indexPath)
        let text = seat[indexPath.row].seatNo
        var condition = seat[indexPath.row].seatCondition
        let pnr = ticket!.pnr
        let reservatedPnr = reservationDict.keys
        let reservatedSeats = Array(reservationDict.values)
        
        if reservatedPnr.contains(pnr){
            for i in reservatedSeats{
                for k in i{
                    if text == k {
                        condition = 1
                    }
                }
            }
        }
        if condition == 1 {
            createAlert(title: "Bu koltuk satılmıştır.")

        }
        else {
            if seat[indexPath.row].seatNo != "" && seat[indexPath.row].seatCondition == 0 {
                let i = seat[indexPath.row].seatNo
                print("\(seat[indexPath.row].seatNo) nolu satıra tıkladım")

                if seatNo.count < 5 || seatNo.contains(i) {
                    if seatNo.contains(i){
                        if let index = seatNo.firstIndex(of: i) {
                            seatNo.remove(at: index)
                        }
                        selectedSeats.text = "Seçilen koltuklar : \(seatNo.joined(separator: ","))"
                        priceLabel.text = "Toplam Tutar = \(ticket!.price*seatNo.count)₺"
                        cell?.backgroundColor = .gray
                    }
                    else{

                            addSeat(seatno: i)
                        priceLabel.text = "Toplam Tutar = \(ticket!.price*seatNo.count)₺"
                            selectedSeats.text = "Seçilen koltuklar : \(seatNo.joined(separator: ","))"
                            cell?.backgroundColor = .systemPink

                    }

                }
                else{
                    createAlert(title: "Maksimum 5 koltuk seçebilirsiniz.")
                }
            }
        }
    }
    
}



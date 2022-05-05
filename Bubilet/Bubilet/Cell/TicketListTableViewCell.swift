//
//  TicketListTableViewCell.swift
//  Bubilet
//
//  Created by Hilal Akgül on 15.02.2022.
//

import UIKit

 class TicketListTableViewCell: UITableViewCell {

     
     @IBOutlet weak var LogoImage: UIImageView!
     @IBOutlet weak var LocationFromLabel: UILabel!
     @IBOutlet weak var LocationToLabel: UILabel!
     @IBOutlet weak var TimeLabel: UILabel!
     @IBOutlet weak var DateLabel: UILabel!
     @IBOutlet weak var PriceLabel: UILabel!
     @IBOutlet weak var ChooseButton: UIButton!
     @IBOutlet weak var pnrLabel: UILabel!
     
     var didTapTicket: ((TicketModel) -> Void)?
     var ticketModel: TicketModel?

     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }

     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
         
     }

     func configure(model: TicketModel) {
         self.ticketModel = model
         self.LogoImage.image = UIImage(named: model.logo)
         self.LocationFromLabel.text = model.locationFrom
         self.LocationToLabel.text = model.locationTo
         self.TimeLabel.text = model.time
         self.DateLabel.text = model.date
         self.PriceLabel.text = String(model.price)
         self.pnrLabel.text =  String(model.pnr)

     }

     @IBAction func ChooseTicket(_ sender: Any) {
         guard let unwrappedTicket = ticketModel else { return }

         didTapTicket?(unwrappedTicket)

     }
     
     func selectedTicket(with ticketModel: TicketModel) {
         self.ticketModel = ticketModel

     }
     
 }

//
//  SeatPlanCollectionViewCell.swift
//  Bubilet
//
//  Created by Hilal Akgül on 15.02.2022.
//

import UIKit

class SeatPlanCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var Seatno: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(model: SeatDetail) {

        self.Seatno.text = model.seatNo


    }

}

//
//  PassengerDetailsViewController.swift
//  Bubilet
//
//  Created by Hilal Akgül on 21.02.2022.
//

import UIKit

class PassengerDetailsViewController: UIViewController , UINavigationControllerDelegate {
    

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var PassengerStack: UIStackView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var printTicketButton: UIButton!
    
    var seats = [String]()
    var totalPrice = Int()
    var ticket = TicketModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func printTicket(_ sender: Any) {
        var name = nameTextField.text!.description
        var surname = surnameTextField.text!.description
        var id = idTextField.text!.description
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Get a reference to the second view controller
        let secondViewController = segue.destination as! PrintTicketViewController


        secondViewController.name = nameTextField.text!
        secondViewController.surname = surnameTextField.text!
        secondViewController.id = idTextField.text!
        secondViewController.seats = seats
        secondViewController.price = totalPrice
        secondViewController.ticket = ticket
        


    }
}

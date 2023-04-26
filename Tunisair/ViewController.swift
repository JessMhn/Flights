//
//  ViewController.swift
//  Tunisair
//
//  Created by Mac on 22.04.23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var arrivalTextField: UITextField!
    @IBOutlet weak var departureTextField: UITextField!
    @IBOutlet weak var bottomView: UIView!
    
    lazy var  flightManager = FlightManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

//        bottomView.layer.cornerRadius = bottomView.frame.height / 2
        
        bottomView.applyRoundedCornerRadius()
        
//        view.subviews.forEach { subview in
//            print(subview.tag)
//        }
    
    }


    @IBAction func searchAction(_ sender: Any) {
        // 1. chercher api gratuit pour recherche de vol
        // 2. Faire appel a WS avec l'api en lui donnant l'arrive et le depart
        // 3. afficher le result dans un nv ecran
        //flightManager.search(departure: departureTextField.text ?? "", arrival: arrivalTextField.text ?? "")
        flightManager.searchFlights(from: "PAR", to: "NYC", date: "2023-05-21") { result, error in
            if let error = error {
                print("Error searching flights: \(error.localizedDescription)")
            } else if let result = result {
                print("Results: \(result)")
            }
        }

    }
}


//
//  PersonController.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 15.12.24.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var fullnameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullnameInput.text = UserDefaults.standard.string(forKey: "fullName")
        emailInput.text = UserDefaults.standard.string(forKey: "email")
    }
    @IBAction func updateButtonTapped(_ sender: Any) {
    }
}

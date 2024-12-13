//
//  RegisterController.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 10.12.24.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet private weak var iconImage: UIImageView!
    
    @IBOutlet private weak var fullNameInput: UITextField!
    
    @IBOutlet private weak var emailInput: UITextField!
    
    @IBOutlet private weak var passwordInput: UITextField!
    
    var registerAction: ((User) -> Void)?
    
    let viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        if let fullName = fullNameInput.text , !fullName.isEmpty,
            let email = emailInput.text, !email.isEmpty,
            let password = passwordInput.text, !password.isEmpty
        {
            var user = User(id: nil, fullName: fullName, email: email, password: password)
            
            viewModel.getData()
            
            user.id = viewModel.getLastUserId() + 1
           
            viewModel.saveUserData(user: user)
            
            registerAction?(user)
            
            navigationController?.popViewController(animated: true)
        }
    }
    

}

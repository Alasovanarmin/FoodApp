//
//  LoginController.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 10.12.24.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if let email = emailInput.text,
            let password = passwordInput.text {
            
            viewModel.getData()
            let checkAuth = viewModel.checkAuth(email: email, password: password)
            
            if !checkAuth {
                showInvalidAlert()
                return
            }
            
            viewModel.setUserDefaults(email: email)
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            
            guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
            
            sceneDelegate.homeRoot()
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let registerController = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        
        registerController.registerAction = { user in
            self.emailInput.text = user.email
            self.passwordInput.text = user.password
        }

        navigationController?.show(registerController, sender: nil)
    }
    
    func showInvalidAlert() {
        let alertController = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

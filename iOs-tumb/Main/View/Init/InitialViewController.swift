//
//  InitialViewController.swift
//  iOs-tumb
//
//  Created by Flavio Gomez on 15/09/2021.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        
        firstButton.layer.cornerRadius = 10.0
        
        emailField.placeholder = "Your Email Account"

        // Do any additional setup after loading the view.
    }

    @IBAction func start(_ sender: Any) {
        
        guard let mailAccount = self.emailField.text else {return}
        if isValidEmail(mailAccount){
                        
            presentTabBarController()
        } else {
            
            let alert = UIAlertController(title: "Error!", message: "Please, insert a valid email account", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            
            
            self.present(alert, animated: true)
            
        }

    }
    
    private func presentTabBarController(){
        
        let tabBarController = TabViewController()
        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}

extension InitialViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

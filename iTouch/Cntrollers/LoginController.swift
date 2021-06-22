//
//  ViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 06.06.21.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextFied: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        staylView()
        
    }
    
    func staylView() {
        
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
    
    func delegatesTextField() {
        userTextField.delegate = self
        passwordTextFied.delegate = self
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
        
    }
    
}

extension LoginController: UITextFieldDelegate {
    
    
}

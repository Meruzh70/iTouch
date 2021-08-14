//
//  ViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 06.06.21.
//

import UIKit

class LoginController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet weak var myImage: UIImageView!

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextFied: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        staylView()
        delegatesTextField()
        configureGesture()
       
    }
    
    func staylView() {
        
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
    
    func delegatesTextField() {
        userTextField.delegate = self
        passwordTextFied.delegate = self
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
        let mainStory = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MyTabBarController") as! MyTabBarController
        self.present(mainStory, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasAction(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        
        let goSignUpStory = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.present(goSignUpStory, animated: true, completion: nil)
    }
//    MARK: Tap Gesture for close keyboard
    func configureGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeybord))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    @objc func closeKeybord() {
        userTextField.resignFirstResponder()
        passwordTextFied.resignFirstResponder()
       
    }
   
}

extension LoginController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            userTextField.resignFirstResponder()
            passwordTextFied.becomeFirstResponder()
  
        } else if textField == passwordTextFied {
            passwordTextFied.resignFirstResponder()
        }
        return true
    }
}

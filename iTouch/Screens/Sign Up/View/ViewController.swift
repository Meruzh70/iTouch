//
//  ViewController.swift
//  fullLoginPages
//
//  Created by Meruzhan Avetisyan on 16.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpasswordTxtField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var emailtext: String?
    var passwordtext: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTextField()
        
        
    }
    
    func delegateTextField() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmpasswordTxtField.delegate = self
        userNameTextField.delegate = self
        phoneTextField.delegate = self
    }
    
    
    @IBAction func accountButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        
        let necxtVc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        
        
        
        self.present(necxtVc, animated: true, completion: nil)
    }
    
    @IBAction func logInAction(_ sender: UIButton) {
        
        
//        if myValidation() {
//
//            goToNextPage()
//        } else {
//
//            let alert = UIAlertController(title: "Message", message: "Password is wrong", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: .none))
//            self.present(alert, animated: true, completion: .none)
//        }
//    }
    
    
    func goToNextPage() {
        
        let nextVC = UIStoryboard(name: "UserPage", bundle: .main).instantiateViewController(withIdentifier: "UserPageViewController") as! UserPageViewController
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //@discardableResult
//    func myValidation() -> Bool {
//
//        if !(emailtext?.isEmail ?? (emailTextField.text != nil)) {
//            emailTextField.layer.borderWidth = 2
//            emailTextField.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
//            return false
//        }
//
//        if !(passwordtext?.isValidPassword ?? (emailTextField.text != nil)) {
//
//            passwordTextField.layer.borderWidth = 2
//            passwordTextField.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
//            return false
//        }
//        emailTextField.layer.borderColor = .none
//        passwordTextField.layer.borderColor = .none
//        return true
//
//    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField  {
            
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        
        if textField == passwordTextField  {
            
            passwordTextField.resignFirstResponder()
            confirmpasswordTxtField.becomeFirstResponder()
            //            self.view.frame.origin.y = 0
        }
        if textField == confirmpasswordTxtField {
            
            confirmpasswordTxtField.resignFirstResponder()
            userNameTextField.becomeFirstResponder()
        }
        if textField == userNameTextField {
            
            userNameTextField.resignFirstResponder()
            phoneTextField.becomeFirstResponder()
        }
        if textField == phoneTextField {
            phoneTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        emailtext = emailTextField.text
        passwordtext = passwordTextField.text
        myValidation()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        
        return true
    }
}

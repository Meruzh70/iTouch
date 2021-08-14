//
//  SignUpViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 30.06.21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPassTxtField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    var signUpViewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpStayle()
        // Do any additional setup after loading the view.
    }
    
    func signUpStayle() {
        createButton.layer.cornerRadius = 20
    }



    @IBAction func backAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func createAction(_ sender: UIButton) {
        
        signUpViewModel.createUser(name: "test", surname: "byMeruzh", phone: "077338812", email: "janmeruj2@mail.ru", password: "Merujjan") { message, status in
            print("\(message)", "\(status)")
        }
    }
    
    func createUser (name: String, surname: String, phone: String, email: String, password: String) {
    
        
    }
}

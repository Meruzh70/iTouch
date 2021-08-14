//
//  SignUpViewModel.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 13.08.21.
//

import UIKit

class SignUpViewModel: NSObject {

    
    func createUser (name: String, surname: String, phone: String, email: String, password: String, callBack: (_ message: String, _ status: Int) -> Void) {
    
        NetworkManager.shared.createUser(name: name, surname: surname, phone: phone, email: email, password: password) {message, status in
            
            callBack( message, status)
        }
    }
}

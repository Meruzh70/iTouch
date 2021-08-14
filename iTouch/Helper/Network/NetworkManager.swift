//
//  NetworkManager.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 13.08.21.
//

import UIKit
import Alamofire

enum BASE_URL: String {
    
    case dev = "https://buildings.am/dev"
    case prod = "https://buildings.am"
}

class NetworkManager: NSObject {

    static let shared = NetworkManager()
    
//    MARK: create user
    func createUser (name: String, surname: String, phone: String, email: String, password: String, callBack: (_ message: String, _ status: Int) -> Void) {
        
        let params  = [ "name": name,
                        "surname": surname,
                        "phone": phone,
                        "email": email,
                        "password": password
    ]
        AF.request("https://buildings.am/api/signIn", method: .post, parameters: params).responseJSON { response in
            print(response.data)
            
            var json = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
                    
            print(json)
        }
        
//        AF.request("https://buildings.am/api/signIn", method: .post, parameters: params).response { response  in
//
//            print(response.data)
//            var json = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
//            print("json")
//        }
    }
    
//    MARK: Get user info
    func getUserInfo(message: String, status: Int, user: String, callBack: (_ signUpResponse: SignUpResponse ) -> Void) {
        
        var params: Parameters = [String: Any]()
        params = [:]
        
        AF.request("\(BASE_URL.prod)/api/register", method: .get, parameters: params).responseJSON { response in
            
            print(response)
        }
    }
}

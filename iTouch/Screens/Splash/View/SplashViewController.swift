//
//  SplashViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 30.06.21.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.perform(#selector(splashNextPage), with: nil, afterDelay: 1)
    }
    
    @objc func splashNextPage() {
        
        let storyboardVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(identifier: "LoginController") as! LoginController
        
        self.present(storyboardVC, animated: true, completion: nil)
        
    }
}

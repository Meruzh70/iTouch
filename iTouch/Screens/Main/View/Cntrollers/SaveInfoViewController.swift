//
//  SaveInfoViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 11.06.21.
//

import UIKit

class SaveInfoViewController: UIViewController {

    @IBOutlet weak var myImageLogo: UIImageView!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func delegateTextField() {
        linkTextField.delegate = self
    }
    

    @IBAction func saveAction(_ sender: UIButton) {
        
    }
    
}

extension SaveInfoViewController: UITextFieldDelegate  {
    
    
}

//
//  EditingProfileViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 30.06.21.
//

import UIKit
import MobileCoreServices
class MoreViewController: UIViewController {
    
    @IBOutlet weak var myBlureEfect: UIVisualEffectView!
    
    @IBOutlet weak var myHiddenView: UIView!
    @IBOutlet weak var myInfoTable: UITableView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bioTextField: UITextView!
    @IBOutlet weak var saveButtom: UIButton!
    @IBOutlet weak var userNameTxtField: UITextField!
    
    var tableData = ["Edit Profile", "Buy iTouch", "My QR Code", "Log out"]
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTableView()
        configureCoverPhoto()
        configureHiddenView()
    }
    
    func delegateTableView() {
        
        myInfoTable.register(UINib(nibName: "InfoTableViewCell", bundle: .main), forCellReuseIdentifier: "InfoTableViewCell")
        myInfoTable.delegate = self
        myInfoTable.dataSource = self
    }
    
    func configureCoverPhoto() {
        
        coverImage.contentMode = .scaleAspectFill
        
    }
    func actionSheet() {
        let alert = UIAlertController(title: "Choose The Image", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (handler) in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "All Photos", style: .default, handler: { (handler) in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (handler) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .camera
            image.mediaTypes = [kUTTypeImage as String]
            image.delegate = self
            self.present(image, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.delegate = self
            self.present(image, animated: true, completion: nil)
        }
    }
    
    @IBAction func changePhotoAction(_ sender: UIButton) {
        
        actionSheet()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
    }
    @IBAction func hiddenCloseButton(_ sender: Any) {
        myHiddenView.isHidden = true
        myBlureEfect.isHidden = true
        userNameTxtField.resignFirstResponder()
    }
    //    MARK: Configure hidden view
    func configureHiddenView() {
        
        userNameTxtField.delegate = self
        bioTextField.delegate = self
        myHiddenView.layer.cornerRadius = 20
        myHiddenView.frame = CGRect(x: 50, y: 150, width: self.view.frame.width - 100, height: self.view.frame.height - 400)
        myHiddenView.backgroundColor = #colorLiteral(red: 0.09974711388, green: 0.08970224112, blue: 0.09862727672, alpha: 1)
        saveButtom.layer.cornerRadius = 12
        
    }
    
    
}

extension MoreViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        let data = convertFromUIimageTODict(info)
        if let editingImage = data[convertInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage {
            
            print(editingImage)
            self.coverImage.image = editingImage
//            UserDefaults.standard.value(forKey: "\(editingImage)")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func convertFromUIimageTODict(_ input: [UIImagePickerController.InfoKey : Any]) -> [String : Any] {
        
        return Dictionary(uniqueKeysWithValues: input.map( { key, value in (key.rawValue, value)
            
        }))
    }
    
    func convertInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        
        return input.rawValue
    }
}


extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myInfoTable.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
        
        cell.infoLbl.text = tableData[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return  60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print(123)
            myBlureEfect.isHidden = false
            myHiddenView.isHidden = false
            
        default:
            break
        }
    }
    
    
}

extension MoreViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTxtField {
            userNameTxtField.resignFirstResponder()
        }
        return true
    }
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView == bioTextField {
            bioTextField.resignFirstResponder()
        }
        return true
    }
}




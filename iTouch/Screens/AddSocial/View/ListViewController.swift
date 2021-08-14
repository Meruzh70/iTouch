//
//  ListViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 10.06.21.
//

import UIKit

protocol ListViewControllerDelegate: AnyObject {
    
    func saveLink(model: SocialModel)
}


class ListViewController: UIViewController {
    
    @IBOutlet weak var blureView: UIVisualEffectView!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var hiddenButon: UIButton!
    @IBOutlet weak var hiddenImage: UIImageView!
    @IBOutlet weak var hiddenTextField: UITextField!
    @IBOutlet weak var myListCollection: UICollectionView!
    
    weak var delegateLink: ListViewControllerDelegate?
    
    var imageData: [UIImage] = [#imageLiteral(resourceName: "Instagram"),#imageLiteral(resourceName: "facebook"),#imageLiteral(resourceName: "LinkedIn"),#imageLiteral(resourceName: "tiktok"),#imageLiteral(resourceName: "youtube")]
    var indexPathSelect: IndexPath?
    var labelData: [String] = ["Instagram", "Facebook", "Linkdin", "TikTok", "YouTube"]
    var paymantData: [String] = ["Idram", "CashAPP"]
    var contactdata: [String] = ["Text Message", "FaceTime", "Email"]
    var vehicle: String?
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateCollection()
        delegateHiddenTextField()
        configureHiddenView()
        // Do any additional setup after loading the view.
    }
//  MARK: Collection view delegates
    func delegateCollection() {
        
        myListCollection.register(UINib(nibName: "ListCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ListCollectionViewCell")
        myListCollection.delegate = self
        myListCollection.dataSource = self
    }
    
    func delegateHiddenTextField() {
        hiddenTextField.delegate = self
    }
    
    func configureHiddenView() {
        
        hiddenView.layer.cornerRadius = 20
        hiddenView.frame = CGRect(x: 50, y: 150, width: self.view.frame.width - 100, height: self.view.frame.height - 400)
        hiddenView.backgroundColor = #colorLiteral(red: 0.09974711388, green: 0.08970224112, blue: 0.09862727672, alpha: 1)
        
    }
    
    @IBAction func hiddenSaveAction(_ sender: UIButton) {
        
        vehicle = hiddenTextField.text
        hiddenView.isHidden = true
        blureView.isHidden = true
        hiddenTextField.resignFirstResponder()
        
        if let vehicle = vehicle {
            var link = ""
            
            if selectedIndex == 0 {
                
                link = "https://www.instagram.com/\(vehicle)"
            }
            else if selectedIndex == 1 {
                
                if vehicle.contains("https://www.facebook.com/") {
                    link = vehicle
                } else {
                    link = "https://www.facebook.com/\(vehicle)"
                }
                
            }
            else if selectedIndex == 2 {
                //                hiddenTextField.placeholdert = "Username"
                link = "https://www.linkedin.com\(vehicle)"
            }
            else if selectedIndex == 3 {
                link = "https://www.tiktok.com/\(vehicle)"
            }
            else if selectedIndex == 4 {
                link = vehicle
            }
            else {
                link = vehicle
            }
            delegateLink?.saveLink(model: SocialModel(link: link, icon: imageData[selectedIndex], icName: labelData[selectedIndex]))
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        
    }
    
    @IBAction func closeHiddenView(_ sender: UIButton) {
        
        hiddenTextField.resignFirstResponder()
        hiddenView.isHidden = true
        blureView.isHidden = true
        
        
    }
    func showAlert() {
        
        let myAlert = UIAlertController(title: "OOPS!!", message: "now found", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        myAlert.addAction(alertAction)
        self.present(myAlert, animated: true, completion: nil)
        
        
    }
    
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        labelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myListCollection.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as? ListCollectionViewCell
        
        cell?.listImage.image = imageData[indexPath.row]
        cell?.listLabel.text = labelData[indexPath.row]
        cell?.layer.cornerRadius = 12
        cell?.contentMode = .scaleAspectFill
        
        return cell!
        
    }
    //secyion line spascing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 90
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 45, bottom: 0, right: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.item
        hiddenView.isHidden = false
        blureView.isHidden = false
        hiddenImage.image = imageData[indexPath.row]
        
        
    }
    
    
}

extension ListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        vehicle = textField.text
        
        return true
    }
    
}

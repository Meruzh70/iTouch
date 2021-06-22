//
//  ListViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 10.06.21.
//

import UIKit

protocol SendLinkDelegate: AnyObject {
    
    func saveLink(link: String)
}


class ListViewController: UIViewController {
    
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var hiddenButon: UIButton!
    @IBOutlet weak var hiddenImage: UIImageView!
    @IBOutlet weak var hiddenTextField: UITextField!
    @IBOutlet weak var myListCollection: UICollectionView!
    
    weak var delegateLink: SendLinkDelegate?
    var imageData: [UIImage] = [#imageLiteral(resourceName: "Instagram"),#imageLiteral(resourceName: "facebook"),#imageLiteral(resourceName: "LinkedIn"),#imageLiteral(resourceName: "tiktok"),#imageLiteral(resourceName: "youtube")]
    var indexPathSelect: IndexPath?
    var labelData: [String] = ["Instagram", "Facebook","Linkdin", "TikTok", "YouTube"]
    var vehicle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateCollection()
        delegateHiddenTextField()
        configureHiddenView()
        // Do any additional setup after loading the view.
    }
    
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
        hiddenView.frame = CGRect(x: 50, y: 150, width: self.view.frame.width - 100, height: self.view.frame.height - 300)
        
    }
    
    @IBAction func hiddenSaveAction(_ sender: UIButton) {
        
        vehicle = hiddenTextField.text
        hiddenView.isHidden = true
        hiddenTextField.resignFirstResponder()
        if let vehicle = vehicle {
            
            delegateLink?.saveLink(link: vehicle)
            
            let backVC = storyboard?.instantiateViewController(identifier: "UserPagesViewController") as? UserPagesViewController
            
            self.navigationController?.pushViewController(backVC!, animated: true)
        }
        
        
        
    }
    
    @IBAction func closeHiddenView(_ sender: UIButton) {
        
        hiddenTextField.resignFirstResponder()
        hiddenView.isHidden = true
        
        
    }
    
    
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        labelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myListCollection.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as? ListCollectionViewCell
        
        cell?.listImage.image = imageData[indexPath.row]
        cell?.layer.cornerRadius = 12
        cell?.contentMode = .scaleAspectFill
        
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 45, bottom: 0, right: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        hiddenView.isHidden = false
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
        print(vehicle)
        return true
        print(vehicle)
    }
    

    
}

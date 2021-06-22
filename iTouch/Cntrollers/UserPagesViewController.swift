//
//  UserPagesViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 06.06.21.
//

import UIKit

class UserPagesViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var dataArray: [UIImage] = [#imageLiteral(resourceName: "pluse")]
    var getLink: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegatesCollection()
        let obj = ListViewController()
        obj.delegateLink = self
        // Do any additional setup after loading the view.
    }
    
    func delegatesCollection() {
        
        myCollectionView.register(UINib(nibName: "myCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "myCollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UserPagesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as? myCollectionViewCell
        
        cell?.imageCollection.image = dataArray[indexPath.row]
        cell?.contentMode = .scaleAspectFill
        cell?.layer.cornerRadius = 15
        
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 45, bottom: 0, right: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "ListViewController")
        nextVC?.modalTransitionStyle = .flipHorizontal
        nextVC?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextVC!, animated: true)
        
    }
    
    
    
    
}

extension UserPagesViewController: SendLinkDelegate {
    
    func saveLink(link: String) {
        
        getLink = link
        print(getLink)
        
    }
    
    
}

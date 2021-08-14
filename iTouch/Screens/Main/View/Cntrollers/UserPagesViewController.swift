//
//  UserPagesViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 06.06.21.
//

import UIKit

struct SocialModel {
    var link: String = ""
    var icon: UIImage?
    var icName: String?
}

class UserPagesViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var dataArray: [SocialModel] = []
    var getLink: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegatesCollection()
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func delegatesCollection() {
        
        myCollectionView.register(UINib(nibName: "myCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "myCollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    
}

extension UserPagesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell
        
        if indexPath.item == dataArray.count {
            cell.imageCollection.image = UIImage(named: "pluse")
        } else {
            cell.layer.cornerRadius = 15.0
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 0.0
            cell.backgroundView?.layer.shadowColor = UIColor.black.cgColor
            cell.backgroundView?.layer.shadowRadius = 5
            cell.backgroundView?.layer.shadowOpacity = 1
            cell.backgroundView?.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowRadius = 5
            cell.layer.shadowOpacity = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.imageCollection.image = dataArray[indexPath.row].icon
            cell.iconName.text = dataArray[indexPath.row].icName
        }
        
        cell.contentMode = .scaleAspectFill
        cell.layer.cornerRadius = 15
        
        return cell
        
    }
    //    MARK: Drag configure
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = dataArray[indexPath.row]
        
        let itemProvider = NSItemProvider(object: item as Any as! NSItemProviderWriting) //????
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
    //    MARK: Drop configure
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        var destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }
        if coordinator.proposal.operation == .move {
            
            self.RecorderItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
        }
    }
    
    fileprivate func RecorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
        
        if let item = coordinator.items.first,
           let sourceIndexPath = item.sourceIndexPath {
            
//            /edscmndncdknckldckkdckd
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 45, bottom: 0, right: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        if indexPath.item == dataArray.count {
            
            let nextVC = UIStoryboard(name: "AddSocial", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController
            nextVC?.modalTransitionStyle = .flipHorizontal
            nextVC?.modalPresentationStyle = .fullScreen
            nextVC?.delegateLink = self
            self.navigationController?.pushViewController(nextVC!, animated: true)
        } else {
            UIApplication.shared.open(URL(string: dataArray[indexPath.item].link)!, options: [:], completionHandler: nil)
        }
        
    }
    
    //    func configureCellMove() {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.minimumLineSpacing = 0
    //        layout.minimumInteritemSpacing = 0
    //
    //        let collection = UICollectionView(frame: <#T##CGRect#>, collectionViewLayout: <#T##UICollectionViewLayout#>)
    //    }
    //
    //
    //
    //
}

extension UserPagesViewController: ListViewControllerDelegate {
    
    func saveLink(model: SocialModel) {
        
        print(model)
        self.dataArray.append(model)
        self.myCollectionView.reloadData()
        
    }
    
    
}



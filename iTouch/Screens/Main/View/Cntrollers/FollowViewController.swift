//
//  FollowViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 04.07.21.
//

import UIKit

class FollowViewController: UIViewController {
    
    @IBOutlet weak var followsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDelegates()
    }
    
    
    func configureDelegates() {
        
        followsTable.register(UINib(nibName: "FollowsTableViewCell", bundle: .main), forCellReuseIdentifier: "FollowsTableViewCell")
        followsTable.delegate = self
        followsTable.dataSource = self
    }
}

extension FollowViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = followsTable.dequeueReusableCell(withIdentifier: "FollowsTableViewCell") as! FollowsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Following"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return configureHeaderView()
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
  
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 200 }
    
    func configureHeaderView() -> UIView {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120))
        headerView.backgroundColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998808503, alpha: 1)
        let labelInView = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: 35))
        labelInView.text = "Following"
        labelInView.font = .boldSystemFont(ofSize: 30)
        let textField = UITextField(frame: CGRect(x: 20, y: 65, width: self.view.frame.width - 40, height: 40))
        textField.placeholder = "Search"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        headerView.addSubview(labelInView)
        headerView.addSubview(textField)
        return headerView
    }
}

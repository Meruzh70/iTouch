//
//  InfoTableViewCell.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 06.07.21.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCells: UIView!
    @IBOutlet weak var infoLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViewCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    MARK: Configure view stayle
    
    func configureViewCells() {
        
        viewCells.layer.cornerRadius = 6
    }
    
}

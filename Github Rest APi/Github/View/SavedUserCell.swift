//
//  SavedUserCell.swift
//  Github Rest APi
//
//  Created by Umang Kedan on 04/03/24.
//

import UIKit

class SavedUserCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setCellData(name:String? , email : String?){
        nameLabel.text = name
        emailLabel.text = email
        
    }
    
    
}

//
//  ProfileController.swift
//  Github Rest APi
//
//  Created by Umang Kedan on 05/03/24.
//

import UIKit
import Kingfisher

class ProfileController: UIViewController {
    
    let userModel = UserModel()
   
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var repoLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var userData:GitHubUser?
    var is_selected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserProfile()
        
        if is_selected{
            saveButton.isHidden = false
        } else {
            saveButton.isHidden = true
        }
    }
    
    func addUserToCoreData() {
        guard let userData = userData else {
            return
        }
        userModel.saveUserToCoreData(user: userData)
    }
    
    func updateUserProfile() {
        if let url = userData?.avatar_url, let imageUrl = URL(string: url) {
                imageView.kf.setImage(with: imageUrl)
            }
    
        nameLabel.text = userData?.name
        usernameLabel.text = userData?.login
        bioLabel.text = "\(userData?.bio ?? "")"
        emailLabel.text = userData?.email
        followerLabel.text = "\(userData?.followers ?? 0)"
        followingLabel.text = "\(userData?.following ?? 0)"
        locationLabel.text = "Location- \(userData?.location ?? "")"
        repoLabel.text = "Repos- \((userData?.public_repos ?? 0) + (userData?.total_private_repos ?? 0))"
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        addUserToCoreData()
        
        AlerUser.alertUser(viewController: self, title: "Submitted ", message: "User info added successfully" , action: UIAlertAction(title: "Ok", style: .default, handler: {_ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
    }
    
}


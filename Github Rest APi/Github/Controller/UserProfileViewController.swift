//
//  UserProfileViewController.swift
//  Github Rest APi
//
//  Created by Inderpreet Singh on 01/03/24.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let userLabel = UILabel()
    let bioLabel = UILabel()
    
    var userData:GitHubUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserProfile()
        setupUI()
    }
    
    func updateUserProfile() {
        profileImageView.downloaded(from: userData?.avatar_url ?? "") { image in
            self.profileImageView.image = image
        }
        userLabel.text = userData?.name
        bioLabel.text = userData?.bio
    }
    
    func setupUI() {
        // Profile Image
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        profileImageView.frame = CGRect(x: (view.frame.width - 120) / 2, y: 100, width: 120, height: 120)

        // UserName
        userLabel.font = UIFont.boldSystemFont(ofSize: 20)
        userLabel.frame = CGRect(x: 20, y: profileImageView.frame.maxY + 20, width: view.frame.width - 40, height: 30)
        
        // UserBio
        bioLabel.font = UIFont.systemFont(ofSize: 16)
        bioLabel.frame = CGRect(x: 20, y: userLabel.frame.maxY + 10, width: view.frame.width - 40, height: 100)
        
        // add to View
        view.addSubview(profileImageView)
        view.addSubview(userLabel)
        view.addSubview(bioLabel)
    }
}


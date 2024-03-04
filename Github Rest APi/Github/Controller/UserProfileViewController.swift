//
//  UserProfileViewController.swift
//  Github Rest APi
//
//  Created by Umang on 01/03/24.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let userModel = UserModel()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserProfile()
       
    }
    
    func addUserToCoreData() {
        guard let userData = userData else {
            return
        }
        userModel.saveUser(gitHubUser: userData)
    }
//        userModel.addUser(name: userData.name ?? "",
//                         login: userData.login ?? "",
//                         location: userData.location ?? "",
//                         bio: userData.bio ?? "",
//                         email: userData.email ?? "",
//                         public_repos:Int16(userData.public_repos ?? 0) ,
//                         total_private_repos: Int16(userData.total_private_repos ?? 0),
//                         avatar_url: userData.avatar_url ?? "",
//                         followers: Int16(userData.followers ?? 0),
//                         following: Int16(userData.following ?? 0))

    
    
    func updateUserProfile() {
        imageView.downloaded(from: userData?.avatar_url ?? "") { image in
            self.imageView.image = image
        }
        nameLabel.text = userData?.name
        usernameLabel.text = userData?.login
        bioLabel.text = "Bio -\(userData?.bio ?? "")"
        emailLabel.text = userData?.email
        followerLabel.text = "\(userData?.followers ?? 0)"
        followingLabel.text = "\(userData?.following ?? 0)"
        locationLabel.text = "Location-\(userData?.location ?? "")"
        repoLabel.text = "Repos-\((userData?.public_repos ?? 0) + (userData?.total_private_repos ?? 0))"
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        addUserToCoreData()
        AlerUser.alertUser(viewController: self, title: "Submitted ", message: "User info added successfully")
    }
    
    //    func setupUI() {
//        // Profile Image
//        profileImageView.contentMode = .scaleAspectFit
//        profileImageView.clipsToBounds = true
//        profileImageView.frame = CGRect(x: (view.frame.width - 120) / 2, y: 100, width: 120, height: 120)
//        profileImageView.layer.cornerRadius = 60
//
//        // UserFName
//        userLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        userLabel.numberOfLines = 5
//        userLabel.frame = CGRect(x: 20, y: profileImageView.frame.maxY + 20, width: view.frame.width - 40, height: 30)
//        
//        // UserName
//        userName.font = UIFont.systemFont(ofSize: 16)
//        userName.textColor = .gray
//        userName.frame = CGRect(x: 20, y: userLabel.frame.maxY, width: view.frame.width - 40, height: 30)
//        
//        // UserBio
//        bioLabel.font = UIFont.systemFont(ofSize: 16)
//        bioLabel.numberOfLines = 5
//        bioLabel.frame = CGRect(x: 20, y: userName.frame.maxY + 10, width: view.frame.width - 40, height: 100)
//        
//        // UserEmail
//        emailLable.font = UIFont.systemFont(ofSize: 16)
//        emailLable.numberOfLines = 5
//        emailLable.frame = CGRect(x: 20, y: bioLabel.frame.maxY + 10, width: view.frame.width - 40, height: 20)
//        
//        // UserFollowers
//        followers.font = UIFont.boldSystemFont(ofSize: 16)
//        followers.numberOfLines = 5
//        followers.frame = CGRect(x: 20, y: emailLable.frame.maxY + 10, width: view.frame.width - 40, height: 20)
//        
//        
//        // Userfollowing
//        following.font = UIFont.boldSystemFont(ofSize: 16)
//        following.numberOfLines = 5
//        following.frame = CGRect(x: 20, y: followers.frame.maxY + 10, width: view.frame.width - 40, height: 20)
//        
//        // UserLocation
//        location.font = UIFont.systemFont(ofSize: 16)
//        location.numberOfLines = 5
//        location.frame = CGRect(x: 20, y: following.frame.maxY + 10, width: view.frame.width - 40, height: 20)
//        
//        // UserRepos
//        reposCount.font = UIFont.systemFont(ofSize: 16)
//        reposCount.numberOfLines = 5
//        reposCount.frame = CGRect(x: 20, y: location.frame.maxY + 10, width: view.frame.width - 40, height: 20)
//        
//        // add to View
//        view.addSubview(profileImageView)
//        view.addSubview(userLabel)
//        view.addSubview(userName)
//        view.addSubview(bioLabel)
//        view.addSubview(emailLable)
//        view.addSubview(followers)
//        view.addSubview(following)
//        view.addSubview(location)
//        view.addSubview(reposCount)
//    }
}


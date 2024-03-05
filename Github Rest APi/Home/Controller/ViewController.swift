//
//  ViewController.swift
//  Github Rest APi
//
//  Created by Umang on 01/03/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let userObj = UserModel()
    let logoImageView = UIImageView()
    let signInWithPassword = UIButton(type: .system)
    let fetchUsers = UIButton(type: .system)
    var details : [GitHubUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        // logoImageView
        logoImageView.image = UIImage(named: "github")
        logoImageView.contentMode = .scaleAspectFill
        let logoSize = CGSize(width: 120, height: 120)
        let logoOrigin = CGPoint(x: (view.frame.width - logoSize.width) / 2, y: 100)
        logoImageView.frame = CGRect(origin: logoOrigin, size: logoSize)
        
        // loginButton
        signInWithPassword.setTitle("Login with token", for: .normal)
        signInWithPassword.addTarget(self, action: #selector(signInWithPasswordButton), for: .touchUpInside)
        let signInWithPasswordFrame = CGRect(x: 40, y: logoImageView.frame.maxY + 50 + 30, width: view.frame.width - 80, height: 40)
        signInWithPassword.frame = signInWithPasswordFrame
        signInWithPassword.tintColor = .white
        signInWithPassword.backgroundColor = UIColorHex().hexStringToUIColor(hex: "#2b3137")
        signInWithPassword.layer.cornerRadius = 9.0
        signInWithPassword.layer.borderColor = UIColorHex().hexStringToUIColor(hex: "#24292e").cgColor
        signInWithPassword.layer.borderWidth = 2.0
        
        fetchUsers.setTitle("Fetch Users", for: .normal)
        let fetchUserFrame = CGRect(x: 40, y: signInWithPasswordFrame.maxY + 30, width: view.frame.width - 80, height: 40)
        fetchUsers.frame = fetchUserFrame
        fetchUsers.tintColor = .white
        fetchUsers.addTarget(self, action: #selector(userList), for: .touchUpInside)
        fetchUsers.backgroundColor = UIColorHex().hexStringToUIColor(hex: "#2b3137")
        fetchUsers.layer.cornerRadius = 9.0
        fetchUsers.layer.borderColor = UIColorHex().hexStringToUIColor(hex: "#24292e").cgColor
        fetchUsers.layer.borderWidth = 2.0
        
        // Add to the view
        view.addSubview(fetchUsers)
        view.addSubview(logoImageView)
        view.addSubview(signInWithPassword)
    }
    
    @objc func signInWithPasswordButton() {
        let signInWithPasswordView = SignInWithPasswordViewController()
        navigationController?.pushViewController(signInWithPasswordView, animated: true)
    }
    
    @objc func userList() {
        DispatchQueue.main.async {
            let savedUserViewController = SavedUserController()
                self.navigationController?.pushViewController(savedUserViewController, animated: true)
            }
        }
    }


//
//  SavedUserController.swift
//  Github Rest APi
//
//  Created by Umang Kedan on 04/03/24.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

class SavedUserController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let userObj = UserModel()
    var userArray : [GitHubUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        fetchUsersWithActivityIndicator()
    }
    
    func fetchUsers(){
        if let user = userObj.fetchUserFromCoreData(){
            userArray = user
            print(userArray)
        }
    }
    
    func fetchUsersWithActivityIndicator() {
        let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 180, y: 300, width: 60, height: 60))
        activityIndicator.color = .red
        activityIndicator.type = .pacman
        tableView.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        // Fetch users after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.fetchUsers()
            self.tableView.reloadData()
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SavedUserCell", bundle: .main), forCellReuseIdentifier: "userCell")
    }
}

extension SavedUserController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? SavedUserCell else {
            return UITableViewCell()
        }
        
        let user = userArray[indexPath.row]
        cell.setCellData(name: user.name, email: user.bio)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userProfileController = ProfileController()
        let userDetail = userArray[indexPath.row]
        DispatchQueue.main.async {
            userProfileController.userData = userDetail
            userProfileController.is_selected = false
            self.navigationController?.pushViewController(userProfileController, animated: true)
        }
    }
}

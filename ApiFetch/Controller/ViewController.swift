//
//  ViewController.swift
//  ApiFetch
//
//  Created by GauravChauhan677 on 18/11/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tblView: UITableView!
    var viewModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewModelUser.vc = self
      //  viewModelUser.getAllUserData()
        viewModelUser.getAllUserDataAF()
        
    //    tblView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        let modelUser = viewModelUser.arrUsers[indexPath.row]
        
        if let id = modelUser.id {
            cell?.lblId.text = "\(id)"
            
        } else {
            cell?.lblId.text = "No Id"
        }
        
      //  cell?.lblId.text = "\(modelUser.id)"
        cell?.lblTitle.text = modelUser.title
        return cell!
    }
}

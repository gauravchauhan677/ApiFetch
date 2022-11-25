//
//  UserViewModel.swift
//  ApiFetch
//
//  Created by GauravChauhan677 on 18/11/22.
//

import UIKit
import Alamofire

class UserViewModel {
    
    weak var vc: ViewController?
    var arrUsers = [UserModel]()
    
    func getAllUserDataAF() {
        
        AF.request("https://jsonplaceholder.typicode.com/todos/").response { response in
            
            if let data = response.data {
                do {
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    // print(userResponse)
                    //                        for modelUser in userResponse {
                    //                            self.arrUsers.append(modelUser)
                    //                        }
                    //                        print(self.arrUsers)
                    self.arrUsers.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tblView.reloadData()
                    }
                }catch let err {
                    print(err.localizedDescription)
                }
            }
        }
        
    }
    
    func getAllUserData() {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, error) in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        // print(userResponse)
                        //                        for modelUser in userResponse {
                        //                            self.arrUsers.append(modelUser)
                        //                        }
                        //                        print(self.arrUsers)
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tblView.reloadData()
                        }
                    }catch let err {
                        print(err.localizedDescription)
                    }
                }
                
                
            } else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
    
}


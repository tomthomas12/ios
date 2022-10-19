//
//  ProfileViewController.swift
//  frist
//
//  Created by ARM 097 on 14/10/22.
//

import UIKit
import FirebaseAuth
class ProfileViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//logout
    @IBAction func logoutUser(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
        self.navigationController?.popToRootViewController(animated: true)
    }

}

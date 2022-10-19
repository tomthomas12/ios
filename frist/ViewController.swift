//
//  ViewController.swift
//  frist
//
//  Created by ARM 097 on 11/10/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailFeild: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!

    
    @IBOutlet weak var signup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
                    let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "tabController") as! tabController
            self.navigationController?.pushViewController(viewcontroller, animated: false)
                }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
        func didPressLogin(_ sender: Any) {

        }
        
    @IBAction func login(_ sender: Any) {
        if let email = emailFeild.text, let password = passwordField.text  {
                   
                   Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                       if let e = error{
                           print(e.localizedDescription)
                       }
                       else{
                           UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
                           let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabController")as! tabController
                           self.show(vc, sender: self)
                       }
                     
                   }
                   
               }
               
    }
    
    @IBAction func signup(_ sender: Any) {
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "SignViewController") as! SignViewController
self.navigationController?.pushViewController(viewcontroller, animated: false)
        
    }

            }



    
    



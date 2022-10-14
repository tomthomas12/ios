//
//  ViewController.swift
//  frist
//
//  Created by ARM 097 on 11/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailFeild: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
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
        if  emailFeild.text == "tom" && passwordField.text == "hey"{
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            let st = UIStoryboard(name: "Main", bundle: nil)
           if  let viewcontroller  = st.instantiateViewController(withIdentifier: "tabController") as? tabController {
          
        //  var em = emailFeild.text
//            viewcontroller.email  = em ?? ""
            self.navigationController?.pushViewController(viewcontroller, animated: false)
            }
        
        }
        else{
            emailFeild.backgroundColor = #colorLiteral(red: 1, green: 0.1509880424, blue: 0.02682900801, alpha: 1);
            passwordField.backgroundColor = #colorLiteral(red: 1, green: 0.1509880424, blue: 0.02682900801, alpha: 1)
          
        }
    }
}


    
    



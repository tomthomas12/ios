//
//  ViewController.swift
//  frist
//
//  Created by ARM 097 on 03/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailFeild: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }	
    @IBAction func didPressLogin(_ sender: Any) {
        if  emailFeild.text == "tom@email.com" && passwordField.text == "hello"{
            let st = UIStoryboard(name: "Main", bundle: nil)
           if  let viewcontroller  = st.instantiateViewController(withIdentifier: "LandingViewController") as? LandingViewController {
                self.navigationController?.pushViewController(viewcontroller, animated: false)
            }
        
        }
        else{
            emailFeild.backgroundColor = #colorLiteral(red: 1, green: 0.1509880424, blue: 0.02682900801, alpha: 1);
            passwordField.backgroundColor = #colorLiteral(red: 1, green: 0.1509880424, blue: 0.02682900801, alpha: 1)
          
        }
    }
}


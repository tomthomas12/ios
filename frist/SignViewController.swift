//
//  SignViewController.swift
//  frist
//
//  Created by ARM 097 on 17/10/22.
//

import UIKit
import FirebaseAuth


class SignViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func signupaction(_ sender: Any) {
        //checking wheather email and password fields are empty
        if email.text?.isEmpty==true{
            print("no email have been entered")
            return
        }
        if password.text?.isEmpty==true{
            print("no password have been entered")
            return
        }
        //calling the funcation signuptheuser
        signuptheuser()
    }
    
    @IBAction func loginaction(_ sender: Any) {
        //if clicked on the button then go to login page
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
self.navigationController?.pushViewController(viewcontroller, animated: false)
    }
    func signuptheuser(){
        //firebase signup
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard let user = authResult?.user ,error == nil else{
                print("erorr \(error?.localizedDescription)")
                return
            }
        }
    }
}

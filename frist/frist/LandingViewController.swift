//
//  LandingViewController.swift
//  frist
//
//  Created by ARM 097 on 06/10/22.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var emailtxt: UILabel!
    var email=""
    override func viewDidLoad() {
        super.viewDidLoad()
        emailtxt.text=email
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

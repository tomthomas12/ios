//
//  homeViewController.swift
//  frist
//
//  Created by ARM 097 on 10/10/22.
//

import UIKit
import Foundation

class homeViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    
    var models=["aa","bb","cc"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as!  dataTableViewCell
        cell.backgroundColor = .blue
        
        cell.location?.text=models[indexPath.row]
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
    }
    
  
    

}

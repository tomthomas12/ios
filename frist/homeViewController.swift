//
//  homeViewController.swift
//  frist
//
//  Created by ARM 097 on 10/10/22.
//

import UIKit
import Foundation

class homeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableview: UITableView!
    
    var models=["aa","bb","cc"]
    var names = ["je","kl","jp"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableview.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)  as!  ListTableViewCell
        cell.backgroundColor = .blue
        
        cell.location?.text=models[indexPath.row]
        cell.name.text=names[indexPath.row]
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
        let nib=UINib(nibName: "ListTableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "ListTableViewCell")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated:true)
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "favViewController") as! favViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


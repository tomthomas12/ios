//
//  MoviefavViewController.swift
//  frist
//
//  Created by ARM 097 on 19/10/22.
//

import UIKit

class MoviefavViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=fav[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var tableview: UITableView!
    var fav=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        

    }
    


}

//
//  MlistingViewController.swift
//  frist
//
//  Created by ARM 097 on 13/10/22.
//

import UIKit
import SafariServices

class MlistingViewController: UIViewController,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
    var movies = [Movies]()
var fav = [String]()
        override func viewDidLoad() {
            super.viewDidLoad()
            //registing custom cell MovieTableViewCell
            table.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
            table.delegate = self
            table.dataSource = self
            field.delegate = self
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchMovies()
            return true
        }
//searchMovies
        func searchMovies() {
            field.resignFirstResponder()

            guard let text = field.text, !text.isEmpty else {
                return
            }

            let query = text.replacingOccurrences(of: " ", with: "%20")

            movies.removeAll()
//passing api
            URLSession.shared.dataTask(with: URL(string: "https://www.omdbapi.com/?apikey=10334a36&s=\(query)&type=movie")!,
                                       completionHandler: { data, response, error in

                                        guard let data = data, error == nil else {
                                            return
                                        }

                                        print(data)
                                        var result: MovieResult?
                                        do {
                                            result = try JSONDecoder().decode(MovieResult.self, from: data) //json passing
                                        }
                                        catch {
                                            print("error")
                                        }

                                        guard let finalResult = result else {
                                            return
                                        }

                                        let newMovies = finalResult.Search
                                        self.movies.append(contentsOf: newMovies)

                                        DispatchQueue.main.async {
                                            self.table.reloadData()
                                        }

            }).resume()

        }

  
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
            cell.configure(with: movies[indexPath.row])
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
          //  let url = "https://www.imdb.com/title/\(movies[indexPath.row].imdbID)/"
            //let vc = SFSafariViewController(url: URL(string: url)!)
          //  present(vc, animated: true)
            let cell = tableView.cellForRow(at: indexPath) as! MovieTableViewCell
            if movies[indexPath.row].values==false{
                cell.favbut.image=UIImage(named: "heart")
                movies[indexPath.row].values=true
                fav.append(movies[indexPath.row].Title)
            }
            else if movies[indexPath.row].values==true{
                cell.favbut.image=UIImage(named: "like")
                movies[indexPath.row].values=false
                let b=Int(fav.firstIndex(of: movies[indexPath.row].Title)!)
                fav.remove(at: b)
            }
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }

    @IBAction func favbuttonclick(_ sender: Any) {
        let fview=self.storyboard?.instantiateViewController(identifier: "MoviefavViewController") as! MoviefavViewController
        fview.fav=fav
        self.navigationController?.pushViewController(fview, animated: true)
    }
}

    struct MovieResult: Codable {
        let Search: [Movies] //array of the type Movies (structure)
    }

    struct Movies: Codable {
        let Title: String
        let Year: String
        let imdbID: String
        let _Type: String
        let Poster: String
        var values:Bool=false
        private enum CodingKeys: String, CodingKey {
            case Title, Year, imdbID, _Type = "Type", Poster
        }
    }

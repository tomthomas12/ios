//
//  MovieTableViewCell.swift
//  frist
//
//  Created by ARM 097 on 13/10/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet var movieTitleLabel: UILabel!
        @IBOutlet var movieYearLabel: UILabel!
        @IBOutlet var moviePosterImageView: UIImageView!
    
    @IBOutlet weak var favbut: UIImageView!
    //movietablecustomcell
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }

        static let identifier = "MovieTableViewCell"

        static func nib() -> UINib {
            return UINib(nibName: "MovieTableViewCell",
                         bundle: nil)
        }

        func configure(with model: Movies) {
            self.movieTitleLabel.text = model.Title
            self.movieYearLabel.text = model.Year
            let url = model.Poster
            if let data = try? Data(contentsOf: URL(string: url)!) {
                self.moviePosterImageView.image = UIImage(data: data)
            }
        }
        
    }


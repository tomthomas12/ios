//
//  MovieCollectionViewCell.swift
//  frist
//
//  Created by ARM 097 on 11/10/22.
//
//
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var tittleLbl: UILabel!
    func setup(with movie: Movie) {
        movieImageView.image = movie.image
        tittleLbl.text = movie.title
    }
}


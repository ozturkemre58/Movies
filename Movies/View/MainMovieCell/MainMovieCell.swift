//
//  MainMovieCell.swift
//  Movies
//
//  Created by Emre Öztürk on 4.12.2023.
//

import UIKit
import SDWebImage
class MainMovieCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    //IBoutlets:
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topView.addBorder(color: .label, width: 1)
        topView.round()
        
        movieImageView.round(5)
    }

    func setupCell(viewModel: MovieTableViewCellModel) {
        self.nameLabel.text = viewModel.title
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageURL)
    }
}

//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Emre Öztürk on 9.12.2023.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {
 //IBOutlets
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var MovieDescriptionLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    //viewModel
    
    var viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    func configView() {
        self.title = "Movie Detail"
        
        self.movieImageView.sd_setImage(with: viewModel.movieImage)
        self.movieNameLabel.text = viewModel.movieTitle
        self.MovieDescriptionLabel.text = viewModel.movieDescription
    }
}

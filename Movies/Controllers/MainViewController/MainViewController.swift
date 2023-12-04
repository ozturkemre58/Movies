//
//  MainViewController.swift
//  Movies
//
//  Created by Emre Öztürk on 3.12.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //IBoutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //viewModel
    var viewModel: MainViewModel = MainViewModel()
    
    //veriables
    var cellDataSource: [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func configView() {
        self.tableView.backgroundColor = .red
        
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else { return }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self]  movies in
            
            guard let self = self, let movies = movies else { return }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
}


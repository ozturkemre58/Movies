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
    
    //viewModel
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }


    func configView() {
        self.tableView.backgroundColor = .red
        
        setupTableView()
    }
}


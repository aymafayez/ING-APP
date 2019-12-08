//
//  MarketplaceHomeViewController.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class MarketplaceHomeViewController: BaseViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let viewModel: MarketplaceHomeViewModel
    
    // MARK: - Initializers
    init(viewModel: MarketplaceHomeViewModel) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = MarketplaceHomeViewModel()
        super.init(coder: aDecoder)
    }
    
    public override init(nibName: String?, bundle: Bundle?) {
        viewModel = MarketplaceHomeViewModel()
        super.init(nibName: nibName, bundle: bundle)
    }

     // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "MarketplaceHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "MarketplaceHomeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func nextButtonDidPressed(_ sender: Any) {
        let vm = CheckoutViewModel(selectedCartProducts: viewModel.selectedElements)
        let vc = CheckoutViewController(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }

}

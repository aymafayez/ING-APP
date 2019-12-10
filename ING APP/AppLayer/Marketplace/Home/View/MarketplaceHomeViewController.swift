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
    var elementsList: [CartElement]
    
    // MARK: - Properties
    let viewModel: MarketplaceHomeViewModel
    let router: MarketPlaceRouter
    
    // MARK: - Initializers
    init(viewModel: MarketplaceHomeViewModel, router: MarketPlaceRouter) {
        self.viewModel = viewModel
        self.router = router
        elementsList = viewModel.getElementsList()
        super.init(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = MarketplaceHomeViewModel()
        self.router = MarketPlaceRouter()
        elementsList = viewModel.getElementsList()
        super.init(coder: aDecoder)
    }
    
    public override init(nibName: String?, bundle: Bundle?) {
        viewModel = MarketplaceHomeViewModel()
        self.router = MarketPlaceRouter()
        elementsList = viewModel.getElementsList()
        super.init(nibName: nibName, bundle: bundle)
    }

     // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: MarketplaceHomeTableViewCellEnum.nibName.rawValue, bundle: nil), forCellReuseIdentifier: MarketplaceHomeTableViewCellEnum.CellReuseIdentifier.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func nextButtonDidPressed(_ sender: Any) {
        let selectedElementsList = viewModel.getSelectedElementsList(from: elementsList)
        router.next(from: self, selectedElements: selectedElementsList)
    }

}

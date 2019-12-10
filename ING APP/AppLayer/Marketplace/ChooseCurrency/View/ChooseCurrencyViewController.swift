//
//  CurrenciesViewController.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class ChooseCurrencyViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: ChooseCurrencyViewModel
    var selectedCurrency: Currency?
    weak var delegate: ChooseCurrencyDelegate?
    var currenciesList: [String]{
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Initializers
    init(viewModel: ChooseCurrencyViewModel) {
        self.viewModel = viewModel
        currenciesList = [String]()
        super.init(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = ChooseCurrencyViewModel()
        currenciesList = [String]()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
        currenciesList = viewModel.getCurrecnyList(searchString: nil)
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    @IBAction func doneButtonPressed(_ sender: Any) {
        delegate?.didSelectCurrency(currency: selectedCurrency)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CurrenciesTableViewCellEnum.nibName.rawValue, bundle: nil), forCellReuseIdentifier: CurrenciesTableViewCellEnum.CellReuseIdentifier.rawValue)
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
}

//
//  CurrenciesViewController.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class CurrenciesViewController: BaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var viewModel: CurrenciesViewModel
    var selectedCurrency: Currency?
    weak var delegate: CurrenciesProtocol?
    var currenciesList: [String]{
        didSet {
            tableView.reloadData()
        }
    }
    
    
    init(viewModel: CurrenciesViewModel) {
        self.viewModel = viewModel
        currenciesList = [String]()
        super.init(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = CurrenciesViewModel()
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
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CurrenciesTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrenciesTableViewCell")
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        delegate?.didSelectCurrency(currency: selectedCurrency)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

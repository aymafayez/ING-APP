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
    var products: [Product]?{
        didSet {
            tableView.reloadData()
        }
    }
    
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
        products = getProducts()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "MarketplaceHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "MarketplaceHomeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getProducts() -> [Product]? {
       return viewModel.getAllProducts()
    }


    @IBAction func nextButtonDidPressed(_ sender: Any) {
        
        let vm = CheckoutViewModel(selectedProducts: products!)
        let vc = CheckoutViewController(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
        
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

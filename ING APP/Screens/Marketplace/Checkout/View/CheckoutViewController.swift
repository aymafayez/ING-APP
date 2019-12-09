//
//  CheckoutViewController.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class CheckoutViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceValueLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: CheckoutViewModel
    var router: MarketPlaceRouter
    var selectedElements: [CartElement]
    var selectedCurrency: Currency

    
    // MARK: - Initializers
    init(viewModel: CheckoutViewModel, router: MarketPlaceRouter) {
        self.viewModel = viewModel
        self.router = router
        selectedElements = viewModel.getSelectedElements()
        selectedCurrency = .EUR
        super.init(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = CheckoutViewModel(selectedCartProducts: [CartElement]())
        self.router = MarketPlaceRouter()
        selectedElements = [CartElement]()
        selectedCurrency = .EUR
        super.init(coder: aDecoder)
    }
    
     // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.reloadData()
        calculateTotalPriceAndUpdateUI(cartElements: selectedElements, currency: selectedCurrency)
        updateCurrencyLabel(text: selectedCurrency.rawValue)
        makeCurrecyLabelClickable()
        // Do any additional setup after loading the view.
    }

    @IBAction func CheckoutButtonDidPressed(_ sender: Any) {
        calculateTotalPriceAndUpdateUI(cartElements: selectedElements, currency: selectedCurrency)
    }
    
    @objc func currencyLabelDidPressed(sender:UITapGestureRecognizer) {
        let vm = ChooseCurrencyViewModel()
        let vc = ChooseCurrencyViewController(viewModel: vm)
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func calculateTotalPriceAndUpdateUI(cartElements: [CartElement], currency: Currency) {
        showLoadingView()
        viewModel.calculateTotalPrice(cartElements: cartElements, currency: currency, onSuccess: { [weak self] totalPrice in
            self?.currencyLabel.text = currency.rawValue
            self?.totalPriceValueLabel.text = self?.formatTotalPrice(totalPrice: totalPrice)
            self?.hideLoadingView()
            }, onAPIError: { [weak self] error in
                self?.hideLoadingView()
                self?.showErrorView(title: "API Error", description: error)
        }, onConnectionError: { [weak self] error in
                self?.hideLoadingView()
                self?.showErrorView(title: "Connection Error", description: error)
        })
    }
    
    func updateCurrencyLabel(text: String) {
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
        currencyLabel.attributedText = attributedText
    }
    
    private func formatTotalPrice(totalPrice: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true 
        return (formatter.string(from: totalPrice as NSNumber) )
    }

    private func makeCurrecyLabelClickable(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.currencyLabelDidPressed))
        currencyLabel.isUserInteractionEnabled = true
        currencyLabel.addGestureRecognizer(tap)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: CheckoutTableViewCellEnum.nibName.rawValue, bundle: nil), forCellReuseIdentifier: CheckoutTableViewCellEnum.CellReuseIdentifier.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}



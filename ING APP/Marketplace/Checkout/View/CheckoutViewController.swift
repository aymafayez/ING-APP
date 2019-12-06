//
//  CheckoutViewController.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class CheckoutViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceValueLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var viewModel: CheckoutViewModel
    
    
    init(viewModel: CheckoutViewModel) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = CheckoutViewModel(selectedProducts: [Product]())
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.reloadData()
        calculateTotalPrice()
        setupCurrencyLabel()
        makeCurrecyLabelClickable()
        // Do any additional setup after loading the view.
    }

    
    private func setupTableView() {
        tableView.register(UINib(nibName: "CheckoutTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func CheckoutButtonDidPressed(_ sender: Any) {
         calculateTotalPrice()
    }
    
    func calculateTotalPrice() {
        var totalAmount = 0.0
        for product in viewModel.selectedProducts {
            let amount = product.price * Double(product.numOfElements)
            totalAmount = totalAmount +  amount
        }
        currencyLabel.text = String(totalAmount.truncate(places: 5))
    }
    
    private func setupCurrencyLabel() {
        let text = viewModel.totalAmountCurrency.rawValue
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
        // Add other attributes if needed
        currencyLabel.attributedText = attributedText
    }
    
    private func makeCurrecyLabelClickable(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.currencyLabelDidPressed))
        currencyLabel.isUserInteractionEnabled = true
        currencyLabel.addGestureRecognizer(tap)
    }
    
    @objc func currencyLabelDidPressed(sender:UITapGestureRecognizer) {
        let vm = CurrenciesViewModel()
        let vc = CurrenciesViewController(viewModel: vm)
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
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

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

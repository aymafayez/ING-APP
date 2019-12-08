//
//  MarketplaceHomeTableViewCell.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class MarketplaceHomeTableViewCell: UITableViewCell {

    
    // MARK: - Outlets
    @IBOutlet weak private var  productImageView: UIImageView!
    
    @IBOutlet weak private var productNameLabel: UILabel!
    
    @IBOutlet weak private var productUnitLabel: UILabel!
    
    @IBOutlet weak private var productPriceLabel: UILabel!
    
    @IBOutlet weak private var productCurrencyLabel: UILabel!
    
    @IBOutlet weak private var numOfElementsLabel: UILabel!
    
    
    
    // MARK: - Properties
    weak var delegate: MarketplaceHomeCellDelegate?
    var _productImage: UIImage? {
        didSet{
            self.productImageView.image = _productImage
        }
    }
    
    var _productName: String? {
        didSet{
            self.productNameLabel.text = _productName
        }
    }
    
    var _productUnit: String? {
        didSet{
            self.productUnitLabel.text = _productUnit
        }
    }
    
    var _productPrice: Double? {
        didSet{
            self.productPriceLabel.text = String(_productPrice ?? 0.0)
        }
    }
    
    var _productCurrency: String? {
        didSet{
            self.productCurrencyLabel.text = _productCurrency
        }
    }
    
    var _numOfElements: Int? {
        didSet{
            self.numOfElementsLabel.text = String(_numOfElements ?? 0)
        }
    }
    
    
     // MARK: - Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addToCartButtonIsPressed(_ sender: Any) {
        delegate?.didAddToCart(at:indexPath!)
    }
    
    @IBAction func removeFromCartButtonIsPressed(_ sender: Any) {
        delegate?.didRemoveFromCart(at:indexPath!)
    }
    
    
}

extension UIResponder {
    func next<U: UIResponder>(of type: U.Type = U.self) -> U? {
        return self.next.flatMap({ $0 as? U ?? $0.next() })
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return self.next(of: UITableView.self)
    }
    
    var indexPath: IndexPath? {
        return self.tableView?.indexPath(for: self)
    }
}





//
//  CheckoutTableViewCell.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak private var  productImageView: UIImageView!
    
    @IBOutlet weak private var productNameLabel: UILabel!
    
    @IBOutlet weak private var productUnitLabel: UILabel!
    
    @IBOutlet weak private var productPriceLabel: UILabel!
    
    @IBOutlet weak private var productCurrencyLabel: UILabel!
    
    @IBOutlet weak private var numOfElementsLabel: UILabel!
    
    
    weak var delegate: MarketplaceCheckoutDelegate?
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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func deleteButtonDidPressed(_ sender: Any) {
        delegate?.removeProduct(at: indexPath!)
    }
    
    @IBAction func addToCartButtonIsPressed(_ sender: Any) {
        delegate?.didAddToCart(at:indexPath!)
        
    }
    
    @IBAction func removeFromCartButtonIsPressed(_ sender: Any) {
        delegate?.didRemoveFromCart(at:indexPath! )
    }
    
    
    
}

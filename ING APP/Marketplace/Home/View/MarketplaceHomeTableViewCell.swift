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
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productUnitLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productCurrencyLabel: UILabel!
    @IBOutlet weak var numOfElementsLabel: UILabel!
    
    
    
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
    }
    
    @IBAction func removeFromCartButtonIsPressed(_ sender: Any) {
    }
    
    
    
}

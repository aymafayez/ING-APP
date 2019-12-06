//
//  CurrenciesTableViewCell.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class CurrenciesTableViewCell: UITableViewCell {

    @IBOutlet private weak var currenciesLabel: UILabel!
    
    var currencyString: String? {
        didSet {
            currenciesLabel.text = currencyString
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
    
}

//
//  CurrenciesTableViewCell.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

class CurrenciesTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var currenciesLabel: UILabel!
    
    // MARK: - Properties
    var currencyString: String? {
        didSet {
            currenciesLabel.text = currencyString
        }
    }
        
}

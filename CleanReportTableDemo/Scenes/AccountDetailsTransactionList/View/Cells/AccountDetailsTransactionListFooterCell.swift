//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class AccountDetailsTransactionListFooterCell: UITableViewCell, AccountDetailsTransactionListCell {
    
    @IBOutlet private var totalLabel: UILabel!
    
    func show(row: AccountDetailsTransactionListViewModel) {
        
        guard case let .footer(total, odd) = row else { fatalError("Expected: footer") }
        totalLabel.text = total
        setBackgroundColour(odd: odd)
    }
}


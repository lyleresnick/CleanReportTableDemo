//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class AccountDetailsTransactionListHeaderCell: UITableViewCell, AccountDetailsTransactionListCell {
    
    @IBOutlet private var titleLabel: UILabel!
    
    func show(row: AccountDetailsTransactionListViewModel) {
        
        guard case let .header(title) = row else { fatalError("Expected: header") }
        titleLabel.text = title
    }
}


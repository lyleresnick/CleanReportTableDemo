//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class AccountDetailsTransactionListSubheaderCell: UITableViewCell, AccountDetailsTransactionListCell {
    
    @IBOutlet private var titleLabel: UILabel!
    
    func show(row: AccountDetailsTransactionListViewModel) {
        
        guard case let .subheader( title, odd ) = row else { fatalError("Expected: subheader") }
        titleLabel.text = title
        setBackgroundColour(odd: odd)
    }
}


//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class AccountDetailsTransactionListMessageCell: UITableViewCell, AccountDetailsTransactionListCell {
    
    @IBOutlet private var messageLabel: UILabel!
    
    func show(row: AccountDetailsTransactionListViewModel) {
        
        guard case let .message( message ) = row else { fatalError("Expected: message") }
        messageLabel.text = message
        setBackgroundColour(odd: true)
    }
}

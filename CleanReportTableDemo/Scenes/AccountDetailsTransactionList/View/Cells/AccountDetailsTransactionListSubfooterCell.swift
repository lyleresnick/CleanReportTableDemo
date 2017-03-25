//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class AccountDetailsTransactionListSubfooterCell: UITableViewCell, AccountDetailsTransactionListCell {
    
    func show(row: AccountDetailsTransactionListViewModel) {
        
        guard case let .subfooter( odd ) = row else { fatalError("Expected: subfooter") }
        setBackgroundColour(odd: odd);
    }
}


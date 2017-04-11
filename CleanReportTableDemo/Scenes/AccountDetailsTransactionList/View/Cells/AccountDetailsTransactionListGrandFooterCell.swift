//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class GrandFooterCell: UITableViewCell, AccountDetailsTransactionListCell {
    
    @IBOutlet fileprivate var totalLabel: UILabel!
    
    func show(row: AccountDetailsTransactionListViewModel) {
        
        guard case let .grandfooter(total) = row else { fatalError("Expected: grandfooter") }
        totalLabel.text = total
    }
}

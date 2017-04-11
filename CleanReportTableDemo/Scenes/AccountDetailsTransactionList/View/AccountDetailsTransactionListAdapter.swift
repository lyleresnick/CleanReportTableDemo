//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class AccountDetailsTransactionListAdapter: NSObject {
    
    var presenter: AccountDetailsTransactionListPresenter!
    
}

// MARK: UITableViewDataSource
extension AccountDetailsTransactionListAdapter: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.cellId(at: indexPath.row), for: indexPath)
        (cell as! AccountDetailsTransactionListCell).show(row: presenter.row(at: indexPath.row))
        return cell
    }
}

// MARK: UITableViewDelegate
extension AccountDetailsTransactionListAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.cellHeight(at: indexPath.row)
    }
}


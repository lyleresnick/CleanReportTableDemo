//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class TransactionListAdapter: NSObject {
    
    let presenter: TransactionListPresenter
    
    init(presenter: TransactionListPresenter) {
        self.presenter = presenter
    }
}

// MARK: UITableViewDataSource
extension TransactionListAdapter: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.cellId(at: indexPath.row), for: indexPath)
        (cell as! TransactionListCell).show(row: presenter.row(at: indexPath.row))
        return cell
    }
}

// MARK: UITableViewDelegate
extension TransactionListAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.cellHeight(at: indexPath.row)
    }
}


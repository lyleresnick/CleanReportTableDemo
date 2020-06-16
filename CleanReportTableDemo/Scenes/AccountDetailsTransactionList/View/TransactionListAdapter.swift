//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class TransactionListAdapter: NSObject {
    var rows = [TransactionListRowViewModel]()
}

// MARK: UITableViewDataSource
extension TransactionListAdapter: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rows[indexPath.row].cellId, for: indexPath)
        (cell as! TransactionListCell).show(row: rows[indexPath.row])
        return cell
    }
}

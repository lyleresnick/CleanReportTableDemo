//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class TransactionListAdapter: ViperSimpleTableViewDataSource<TransactionListPresenter>, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.cellHeight(at: indexPath.row)
    }

}

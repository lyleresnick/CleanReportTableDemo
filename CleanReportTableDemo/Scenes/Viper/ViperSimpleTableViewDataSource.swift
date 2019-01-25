//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class ViperSimpleTableViewDataSource<Presenter: ViperSimpleDataSourcePresenter>: NSObject, UITableViewDataSource {
    
    let presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.cellId(at: indexPath.row), for: indexPath)
        (cell as! TransactionListCell).show(row: presenter.row(at: indexPath.row))
        return cell
    }

}

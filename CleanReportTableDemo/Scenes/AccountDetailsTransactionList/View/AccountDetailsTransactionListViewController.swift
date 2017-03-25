//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class AccountDetailsTransactionListViewController: UIViewController {

    var presenter: AccountDetailsTransactionListPresenter! {
        didSet {
            adapter.presenter = presenter
        }
    }

    @IBOutlet private var adapter: AccountDetailsTransactionListAdapter!
    @IBOutlet fileprivate var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewReady()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        AccountDetailsTransactionListConnector(viewController: self).configure()
    }
}

extension AccountDetailsTransactionListViewController: AccountDetailsTransactionListPresenterOutput {
    
    func showReport() {
        tableView.reloadData()
    }
}


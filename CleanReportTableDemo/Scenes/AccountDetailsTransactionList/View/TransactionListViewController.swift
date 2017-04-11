//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class TransactionListViewController: UIViewController {

    var presenter: TransactionListPresenter! {
        didSet {
            adapter.presenter = presenter
        }
    }

    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet private weak var adapter: TransactionListAdapter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewReady()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        TransactionListConnector(viewController: self).configure()
    }
}

extension TransactionListViewController: TransactionListPresenterOutput {
    
    func showReport() {
        tableView.reloadData()
    }
}


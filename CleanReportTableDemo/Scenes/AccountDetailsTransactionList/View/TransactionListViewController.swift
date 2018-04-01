//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class TransactionListViewController: UIViewController {

    var presenter: TransactionListPresenter!
    @IBOutlet fileprivate weak var tableView: UITableView!
    private var adapter: TransactionListAdapter!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        TransactionListConnector(viewController: self).configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAdapter()
        presenter.eventViewReady()
    }
    
    private func configureAdapter() {
        
        adapter = TransactionListAdapter(presenter: presenter)
        tableView.delegate = adapter
        tableView.dataSource = adapter
    }
}

// MARK: TransactionListPresenterOutput

extension TransactionListViewController: TransactionListPresenterOutput {}

// MARK: TransactionListViewReadyPresenterOutput

extension TransactionListViewController: TransactionListViewReadyPresenterOutput {

    func showReport() {
        tableView.reloadData()
    }
}


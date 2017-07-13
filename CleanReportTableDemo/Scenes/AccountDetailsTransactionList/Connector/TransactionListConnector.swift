//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class TransactionListConnector {
    
    private let viewController: TransactionListViewController
    private let adapter: TransactionListAdapter
    private let presenter: TransactionListPresenter
    private let useCase: TransactionListUseCase
    
    init(viewController: TransactionListViewController, adapter: TransactionListAdapter, useCase: TransactionListUseCase, presenter: TransactionListPresenter) {
        
        self.viewController = viewController
        self.adapter = adapter
        self.useCase = useCase
        self.presenter = presenter
    }
    
    convenience init(viewController: TransactionListViewController, adapter: TransactionListAdapter, entityGateway: EntityGateway = EntityGatewayImpl()) {
        
        let useCase = TransactionListUseCase(entityGateway: entityGateway)
        let presenter = TransactionListPresenter(useCase: useCase)
        
        self.init(viewController: viewController, adapter: adapter, useCase: useCase, presenter: presenter)
    }
    
    func configure() {
        viewController.presenter = presenter
        adapter.presenter = presenter

        useCase.output = presenter
        presenter.output = viewController
    }
}

//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit


class AccountDetailsTransactionListConnector {
    
    let viewController: AccountDetailsTransactionListViewController
    var useCase: AccountDetailsTransactionListUseCase
    let presenter: AccountDetailsTransactionListPresenter
    
    init(viewController: AccountDetailsTransactionListViewController, useCase: AccountDetailsTransactionListUseCase, presenter: AccountDetailsTransactionListPresenter) {
        
        self.viewController = viewController
        self.useCase = useCase
        self.presenter = presenter
    }
    
    convenience init(viewController: AccountDetailsTransactionListViewController, entityGateway: EntityGateway = EntityGatewayImpl()) {
        
        let useCase = AccountDetailsTransactionListUseCase(entityGateway: entityGateway)
        let presenter = AccountDetailsTransactionListPresenter(useCase: useCase)
        
        self.init(viewController: viewController, useCase: useCase, presenter: presenter)
    }
    
    func configure() {
        viewController.presenter = presenter
        useCase.presenter = presenter
        presenter.viewController = viewController
    }
}

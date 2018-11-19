//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class TransactionListConnector: ViperConnector<TransactionListViewController, TransactionListPresenter, TransactionListUseCase> {
    
    convenience init(viewController: TransactionListViewController, entityGateway: EntityGateway = EntityGatewayImpl()) {
        
        let useCase = TransactionListUseCase(entityGateway: entityGateway)
        let presenter = TransactionListPresenter(useCase: useCase)
        
        self.init(viewController: viewController, useCase: useCase, presenter: presenter)
    }
    
}

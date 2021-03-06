//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation

class TransactionListUseCase {

    weak var output: TransactionListUseCaseOutput!
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    func eventViewReady() {
        
        let transformer = TransactionListViewReadyTwoSourceUseCaseTransformer(transactionManager: entityGateway.twoSourceManager)
        transformer.transform(output: output)
    }
    
    func eventViewReadyOneSource() {
        
        let transformer = TransactionListViewReadyOneSourceUseCaseTransformer(transactionManager: entityGateway.oneSourceManager)
        transformer.transform(output: output)
    }
}


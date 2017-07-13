//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation

class TransactionListUseCase {

    weak var output: TransactionListUseCaseOutput!
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    func begin() {
        
        let transformer = TransactionListUseCaseBeginTwoSourceTransformer(transactionManager: entityGateway.twoSourceManager)
        transformer.transform(output: output)
    }
    
    func beginOneSource() {
        
        let transformer = TransactionListUseCaseBeginOneSourceTransformer(transactionManager: entityGateway.oneSourceManager)
        transformer.transform(output: output)
    }
}


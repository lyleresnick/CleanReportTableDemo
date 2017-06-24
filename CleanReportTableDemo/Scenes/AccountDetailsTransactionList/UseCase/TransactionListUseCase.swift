//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation

class TransactionListUseCase {

    weak var output: TransactionListUseCaseOutput!
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    func begin() {
        
        let authorizedTransactions = entityGateway.fetchAuthorizedTransactions()
        let postedTransactions = entityGateway.fetchPostedTransactions()
        let transformer = TransactionListBeginTwoSourceUseCaseTransformer(
            authorizedTransactions: authorizedTransactions,
            postedTransactions: postedTransactions)
        transformer.transform(output: output)
    }
    
    func beginOneSource() {
        
        let allTransactions = entityGateway.fetchAllTransactions()
        let transformer = TransactionListBeginOneSourceUseCaseTransformer(
            allTransactions: allTransactions)
        transformer.transform(output: output)
    }
}


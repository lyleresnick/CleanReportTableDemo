//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation


class TransactionListUseCase {

    weak var presenter: TransactionListUseCaseOutput!
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    

    func beginTwoSource() {
        
        let authorizedTransactions = entityGateway.fetchAuthorizedTransactions()
        let postedTransactions = entityGateway.fetchPostedTransactions()
        let transformer = TransactionListBeginTwoSourceUseCaseTransformer(
            authorizedTransactions: authorizedTransactions,
            postedTransactions: postedTransactions)
        transformer.transform(presenter: presenter)
    }
    
    func beginOneSource() {
        
        let allTransactions = entityGateway.fetchAllTransactions()
        let transformer = TransactionListBeginOneSourceUseCaseTransformer(
            allTransactions: allTransactions)
        transformer.transform(presenter: presenter)
    }
    

}


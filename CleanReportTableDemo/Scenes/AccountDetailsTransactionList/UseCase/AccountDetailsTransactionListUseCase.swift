//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation


class AccountDetailsTransactionListUseCase {

    weak var presenter: AccountDetailsTransactionListUseCaseOutput!
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    

    func beginTwoSource() {
        let transformer = AccountDetailsTransactionListTwoSourceUseCaseTransformer(entityGateway: entityGateway)
        transformer.transform( presenter: presenter )
    }
    
    func beginOneSource() {
        let transformer = AccountDetailsTransactionListOneSourceUseCaseTransformer(entityGateway: entityGateway)
        transformer.transform( presenter: presenter )
    }
    

}


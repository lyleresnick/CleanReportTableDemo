//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation


class TransactionListUseCase {

    weak var presenter: TransactionListUseCaseOutput!
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    

    func beginTwoSource() {
        let transformer = TransactionListTwoSourceUseCaseTransformer(entityGateway: entityGateway)
        transformer.transform(presenter: presenter)
    }
    
    func beginOneSource() {
        let transformer = TransactionListOneSourceUseCaseTransformer(entityGateway: entityGateway)
        transformer.transform(presenter: presenter)
    }
    

}


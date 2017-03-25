//  Created by Lyle Resnick on 2016-08-25.
//  Copyright © 2016 Lyle Resnick. All rights reserved.
//

import Foundation


class EntityGatewayImpl: EntityGateway {
    
    func fetchAllTransactions() -> [TransactionEntity] {
        return TransactionEntity.allData
    }
    
    func fetchAuthorizedTransactions() -> [TransactionEntity] {
        return TransactionEntity.authorizedData
    }
    
    func fetchPostedTransactions() -> [TransactionEntity] {
        return TransactionEntity.postedData
    }
    

    
}

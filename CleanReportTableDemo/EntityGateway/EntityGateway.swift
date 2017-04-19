//  Created by Lyle Resnick on 2016-08-25.
//  Copyright © 2016 Lyle Resnick. All rights reserved.
//

import Foundation


protocol EntityGateway {
    
    func fetchAllTransactions() -> [TransactionEntity]?
    
    func fetchAuthorizedTransactions() -> [TransactionEntity]?
    
    func fetchPostedTransactions() -> [TransactionEntity]?
    
}

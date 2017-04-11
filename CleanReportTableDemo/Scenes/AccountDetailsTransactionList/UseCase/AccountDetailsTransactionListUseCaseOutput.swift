//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation

protocol AccountDetailsTransactionListUseCaseOutput: class {
    
    func presentInit()
    func presentHeader(group: TransactionGroup)
    func presentSubheader(date: Date)
    func presentDetail(description: String, amount: Double)
    func presentSubfooter()
    func presentFooter(total: Double)
    func presentGrandFooter(total: Double)
    func presentNotFoundMessage(group: TransactionGroup)
    
    func presentReport()
}

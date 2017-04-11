//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation


class AccountDetailsTransactionListTwoSourceUseCaseTransformer {
    
    typealias Group = TransactionGroup
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    func transform(presenter: AccountDetailsTransactionListUseCaseOutput) {
        
        presenter.presentInit()
        var grandTotal = 0.0

        grandTotal += transform(source: entityGateway.fetchAuthorizedTransactions(), group: .Authorized, presenter: presenter)
        grandTotal += transform(source: entityGateway.fetchPostedTransactions(), group: .Posted, presenter: presenter)
        presenter.presentGrandFooter(grandTotal: grandTotal)
        presenter.presentReport()
    }

    private func transform(source: [TransactionEntity]?, group: Group, presenter: AccountDetailsTransactionListUseCaseOutput) -> Double {
        
        var total = 0.0

        presenter.presentHeader(group: group)
        
        guard let source = source, source.count != 0 else {
            presenter.presentNotFoundMessage(group: group)
            return 0.0
        }
        var transactionStream = source.makeIterator()
        var currentTransaction = transactionStream.next()
        
        while let localCurrentTransaction = currentTransaction {
            
            let currentDate = localCurrentTransaction.date
            presenter.presentSubheader(date: currentDate)
            
            while let localCurrentTransaction = currentTransaction,
                  localCurrentTransaction.date == currentDate {
                
                total += localCurrentTransaction.amount
                presenter.presentDetail(description: localCurrentTransaction.description, amount: localCurrentTransaction.amount)
                currentTransaction = transactionStream.next()
            }
            presenter.presentSubfooter()
        }
        presenter.presentFooter(total: total)
        return total
    }
}

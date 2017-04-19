//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation


class TransactionListTwoSourceUseCaseTransformer {
    
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    func transform(presenter: TransactionListUseCaseOutput) {
        
        presenter.presentInit()

        var grandTotal = 0.0
        grandTotal += transform(source: entityGateway.fetchAuthorizedTransactions(), group: .Authorized, presenter: presenter)
        grandTotal += transform(source: entityGateway.fetchPostedTransactions(), group: .Posted, presenter: presenter)
        presenter.presentGrandFooter(grandTotal: grandTotal)

        presenter.presentReport()
    }

    private func transform(source: [TransactionEntity]?, group: TransactionGroup, presenter: TransactionListUseCaseOutput) -> Double {
        
        var total = 0.0

        presenter.presentHeader(group: group)
        
        if let source = source {

            if source.count == 0 {
                presenter.presentNoTransactionsMessage(group: group)
            }
            else {
                var transactionStream = source.makeIterator()
                var transaction = transactionStream.next()
                
                while let localTransaction = transaction {
                    
                    let currentDate = localTransaction.date
                    presenter.presentSubheader(date: currentDate)
                    
                    while let localTransaction = transaction,
                          localTransaction.date == currentDate {
                        
                        total += localTransaction.amount
                        presenter.presentDetail(description: localTransaction.description, amount: localTransaction.amount)
                        transaction = transactionStream.next()
                    }
                    presenter.presentSubfooter()
                }
                presenter.presentFooter(total: total)
            }
        }
        else {
            presenter.presentNotFoundMessage(group: group)
        }

        return total
    }
}

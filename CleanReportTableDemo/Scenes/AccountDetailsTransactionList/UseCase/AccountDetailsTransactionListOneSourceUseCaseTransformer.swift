//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation


class AccountDetailsTransactionListOneSourceUseCaseTransformer {
    
    private let entityGateway: EntityGateway
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    func transform(presenter: AccountDetailsTransactionListUseCaseOutput) {
        
        var groupStream = ([.Authorized, .Posted] as [TransactionGroup]).makeIterator()
        var currentGroup = groupStream.next()
        
        var transactionStream = entityGateway.fetchAllTransactions().makeIterator()
        var currentTransaction = transactionStream.next()
        
        var minGroup = determineMinGroup(group: currentGroup, transaction: currentTransaction)
        
        presenter.presentInit()

        var grandTotal = 0.0
        while let localMinGroup = minGroup {

            presenter.presentHeader(group: localMinGroup)
            
            if (currentTransaction == nil) || (localMinGroup != currentTransaction!.group) {
                
                presenter.presentNotFoundMessage(group: localMinGroup)
                currentGroup = groupStream.next()
                minGroup = determineMinGroup(group: currentGroup, transaction: currentTransaction)
            }
            else {
                var total = 0.0
                
                while let localCurrentTransaction = currentTransaction, localCurrentTransaction.group == localMinGroup {
                    
                    let currentDate = localCurrentTransaction.date
                    presenter.presentSubheader(date: currentDate)
                    
                    while let localCurrentTransaction = currentTransaction,
                          (localCurrentTransaction.group == localMinGroup) && (localCurrentTransaction.date == currentDate) {
                        
                        let amount = localCurrentTransaction.amount
                        total += amount
                        grandTotal += amount
                        presenter.presentDetail(description: localCurrentTransaction.description, amount: amount)
                        
                        currentTransaction = transactionStream.next()
                    }
                    presenter.presentSubfooter()
                }
                presenter.presentFooter(total: total)
                currentGroup = groupStream.next()
                minGroup = determineMinGroup(group: currentGroup, transaction: currentTransaction)
            }
        }
        presenter.presentGrandFooter(grandTotal: grandTotal)
        presenter.presentReport()
    }
    
    private func determineMinGroup(group: TransactionGroup?, transaction: TransactionEntity?) -> TransactionGroup? {
        
        if (group == nil) && (transaction == nil) {
            return nil
        }
        else if group == nil {
            return transaction!.group
        }
        else if transaction == nil {
            return group
        }
        else {
            return (group!.rawValue < transaction!.group.rawValue) ? group : transaction!.group
        }
    }
}


//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation

class TransactionListViewReadyTwoSourceUseCaseTransformer {
    
    private let transactionManager: TwoSourceManager

    init(transactionManager: TwoSourceManager) {
        self.transactionManager = transactionManager
    }

    func transform(output: TransactionListViewReadyUseCaseOutput) {
        
        output.presentInit()

        var grandTotal = 0.0
        grandTotal += transform(transactions: transactionManager.fetchAuthorizedTransactions(), group: .authorized, output: output)
        grandTotal += transform(transactions: transactionManager.fetchPostedTransactions(), group: .posted, output: output)
        output.presentGrandFooter(grandTotal: grandTotal)

        output.presentReport()
    }
    
    enum State {
        case start
        case top
        case date
        case complete
    }

    private func transform(transactions: [TransactionEntity]?, group: TransactionGroup, output: TransactionListViewReadyUseCaseOutput) -> Double {
        
        var total = 0.0
        output.presentHeader(group: group)
        
        if let transactions = transactions {

            var transactionStream = transactions.makeIterator()
            var transaction: TransactionEntity! = transactionStream.next()
            var state = State.start
            var currentDate: Date!
            
            func process(transaction: TransactionEntity! ) {

                switch state {
                case .start:
                    if transaction == nil {
                        output.presentNoTransactionsMessage(group: group)
                        state = .complete
                        break
                    }
                    fallthrough
                case .top:

                    currentDate = transaction.date
                    output.presentSubheader(date: currentDate)
                    fallthrough
                    
                case .date:
                    
                    state = .date
                    if transaction != nil && transaction.date == currentDate {

                        total += transaction.amount
                        output.presentDetail(description: transaction.description, amount: transaction.amount)
                    }
                    else {
                        output.presentSubfooter()
                        state = .top

                        if transaction == nil {
                            output.presentFooter(total: total)
                            state = .complete
                        }
                    }
                case .complete:
                    break
                }
            }
            
            repeat {
                process(transaction: transaction )
                if transaction == nil { break }
                transaction = transactionStream.next()
            } while true
        }
        else {
            output.presentNotFoundMessage(group: group)
        }

        return total
    }
    
    
}

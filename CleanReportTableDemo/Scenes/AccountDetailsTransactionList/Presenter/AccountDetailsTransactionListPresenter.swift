//  Copyright © 2017 Lyle Resnick. All rights reserved.

import UIKit

class AccountDetailsTransactionListPresenter {
    
    weak var viewController: AccountDetailsTransactionListPresenterOutput!
    
    fileprivate static func dateFormat(format: String ) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    fileprivate static let outboundDateFormat = dateFormat( format: "MMM' 'dd', 'yyyy" )
    
    fileprivate var rows = [AccountDetailsTransactionListViewModel]()
    fileprivate var odd = false
    
    fileprivate let useCase: AccountDetailsTransactionListUseCase
    
    init(useCase: AccountDetailsTransactionListUseCase) {
        self.useCase = useCase
    }

    func viewReady() {
        useCase.beginTwoSource()
    }
    
    func cellId(at index: Int) -> String {
        return rows[ index ].cellId
    }
    
    func cellHeight(at index: Int) -> CGFloat {
        return rows[ index ].height
    }
    
    var rowCount: Int { return rows.count }
    
    func row(at index: Int) -> AccountDetailsTransactionListViewModel { return rows[ index ] }
}

// MARK: AccountDetailsTransactionListPresenterProtocol

extension AccountDetailsTransactionListPresenter: AccountDetailsTransactionListUseCaseOutput {
    
    
    func presentInit() {
        rows.removeAll()
    }

     func presentReport() {
        viewController.showReport()
    }

    func presentHeader( group: TransactionGroup ) {
        
        rows.append(.header(title: group.toString() + " Transactions"));
    }
    
    func presentSubheader( date: Date ) {
        
        odd = !odd;
        rows.append(.subheader(title: formatDate( date: date ), odd: odd))
    }
    
    fileprivate func formatDate( date: Date) -> String {
        return AccountDetailsTransactionListPresenter.outboundDateFormat.string(from: date)
    }
    
    func presentDetail( description: String, amount: Double) {
        
        rows.append( .detail(description: description, amount: String(amount), odd: odd));
    }
    
    func presentSubfooter() {
        
        rows.append(.subfooter( odd: odd ));
    }
    
    func presentFooter( total: Double ) {
        
        odd = !odd;
        rows.append(.footer(total: "\(total)", odd: odd));
    }
    
    func presentGroupNotFoundMessage( group: TransactionGroup ) {
    
        rows.append(.message(message: "\(group.toString()) Transactions are not currently available. You might want to call us and tell us what you think of that!"))
    }
}

//MARK: extension

private extension AccountDetailsTransactionListViewModel {
    
    private enum Cell: String {
        case header
        case subheader
        case detail
        case subfooter
        case footer
        case message
    }
    
    var cellId: String {
        // so we dont expose enum Cell
        return {
            () -> Cell in
            switch self {
            case .header:
                return .header
            case .subheader:
                return .subheader
            case  .detail:
                return .detail
            case .message:
                return .message
            case .footer:
                return .footer
            case .subfooter:
                return .subfooter
            }
        } ().rawValue
    }
    
    var height: CGFloat {
        get {
            switch self {
            case .header:
                return 60.0
            case .subheader:
                return 34.0
            case .detail:
                return 18.0
            case .message:
                return 100.0
            case .footer:
                return 44.0
            case .subfooter:
                return 18.0
            }
        }
    }
}

private extension TransactionGroup  {
    
    func toString() -> String {
        switch self {
        case .Authorized:
            return "Authorized"
        case .Posted:
            return "Posted"
        }
    }
}


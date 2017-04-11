//  Copyright © 2017 Lyle Resnick. All rights reserved.

import Foundation

enum TransactionGroup: String {
    case Authorized = "A"
    case Posted = "P"
    
    func toString() -> String {
        switch self {
        case .Authorized:
            return "Authorized"
        case .Posted:
            return "Posted"
        }
    }
    
    static let groupList: [TransactionGroup] = [.Authorized, .Posted]
}


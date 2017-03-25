//  Copyright © 2017 Lyle Resnick. All rights reserved.


import UIKit

protocol AccountDetailsTransactionListCell {
    func show( row: AccountDetailsTransactionListViewModel )
}


extension AccountDetailsTransactionListCell where Self: UITableViewCell {
    
    func setBackgroundColour(odd: Bool ) {
        
        let backgroundRgb = odd ? 0xF7F8FC : 0xDDDDDD
        backgroundColor = UIColor( rgb: backgroundRgb )
    }
}


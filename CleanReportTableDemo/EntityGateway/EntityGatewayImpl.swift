//  Created by Lyle Resnick on 2016-08-25.
//  Copyright © 2016 Lyle Resnick. All rights reserved.
//

import Foundation


class EntityGatewayImpl: EntityGateway {
    
    var oneSourceManager: OneSourceManager = OneSourceManagerImpl()
    var twoSourceManager: TwoSourceManager = TwoSourceManagerImpl()
}

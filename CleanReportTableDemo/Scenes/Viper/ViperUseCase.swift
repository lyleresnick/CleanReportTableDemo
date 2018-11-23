//
//  ViperUseCase.swift
//  CleanReportTableDemo
//
//  Created by Resnick, Lyle (CA - Toronto) on 2018-08-12.
//  Copyright © 2018 Lyle Resnick. All rights reserved.
//

import Foundation


protocol ViperUseCase: class {
    associatedtype ViperUseCaseOutput

    var output: ViperUseCaseOutput! { get set }
    var entityGateway: EntityGateway {  get }
    
    init(entityGateway: EntityGateway)
}

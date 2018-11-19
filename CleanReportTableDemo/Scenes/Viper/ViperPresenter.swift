//
//  ViperPresenter.swift
//  CleanReportTableDemo
//
//  Created by Resnick, Lyle (CA - Toronto) on 2018-08-12.
//  Copyright © 2018 Lyle Resnick. All rights reserved.
//

import Foundation

protocol ViperPresenter: ViperUseCaseOutput {
    associatedtype ViperUseCase
    associatedtype ViperPresenterOutput

    var output: ViperPresenterOutput! { get set }

    var useCase: ViperUseCase { get }
    
    init(useCase: ViperUseCase)
}

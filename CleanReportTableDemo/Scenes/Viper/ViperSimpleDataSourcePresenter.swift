//
//  ViperSimpleAdapterPresenter.swift
//  CleanReportTableDemo
//
//  Created by Resnick, Lyle (CA - Toronto) on 2018-11-23.
//  Copyright © 2018 Lyle Resnick. All rights reserved.
//

import UIKit


protocol ViperSimpleDataSourcePresenter: ViperPresenter {
    
    func cellId(at index: Int) -> String
    var rowCount: Int { get }
    func row(at index: Int) -> TransactionListViewModel
}

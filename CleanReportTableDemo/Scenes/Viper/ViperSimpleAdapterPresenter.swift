//
//  ViperSimpleAdapterPresenter.swift
//  CleanReportTableDemo
//
//  Created by Resnick, Lyle (CA - Toronto) on 2018-11-23.
//  Copyright © 2018 Lyle Resnick. All rights reserved.
//

import UIKit


protocol ViperSimpleAdapterPresenter: ViperPresenter {
    
    func cellId(at index: Int) -> String
    func cellHeight(at index: Int) -> CGFloat
    var rowCount: Int { get }
    func row(at index: Int) -> TransactionListViewModel
}

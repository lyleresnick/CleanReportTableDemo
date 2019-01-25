//
//  ViperTableViewCell.swift
//  CleanReportTableDemo
//
//  Created by Resnick, Lyle (CA - Toronto) on 2019-01-25.
//  Copyright © 2019 Lyle Resnick. All rights reserved.
//

import Foundation

protocol ViperTableViewCell {
    associatedtype ViewModel 
    func show( row: ViewModel )

}

//
//  ViperViewController.swift
//  CleanReportTableDemo
//
//  Created by Resnick, Lyle (CA - Toronto) on 2018-08-12.
//  Copyright © 2018 Lyle Resnick. All rights reserved.
//

import UIKit

protocol ViperViewController: ViperPresenterOutput {
    associatedtype ViperPresenter

    var presenter: ViperPresenter! {get set}

}

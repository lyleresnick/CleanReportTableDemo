//
//  ViperConnector.swift
//  CleanReportTableDemo
//
//  Created by Resnick, Lyle (CA - Toronto) on 2018-08-12.
//  Copyright © 2018 Lyle Resnick. All rights reserved.
//

import UIKit


class ViperConnector<ViewController: ViperViewController, Presenter: ViperPresenter, UseCase: ViperUseCase> {
    
    private let viewController: ViewController
    private let presenter: Presenter
    private let useCase: UseCase
    
    init(viewController: ViewController, useCase: UseCase, presenter: Presenter) {
        
        self.viewController = viewController
        self.useCase = useCase
        self.presenter = presenter
    }
    
    convenience init(viewController: ViewController, entityGateway: EntityGateway = EntityGatewayImpl()) {
        
        let useCase = ViperConnector.createUseCase(useCaseType: UseCase.self, entityGateway: entityGateway)
        let presenter = ViperConnector.createPresenter(presenterType: Presenter.self, useCase: useCase as! Presenter.ViperUseCase)

        
        self.init(viewController: viewController, useCase: useCase, presenter: presenter)
    }
    
    func configure() {
        viewController.presenter = presenter as? ViewController.ViperPresenter
        useCase.output = presenter as? UseCase.ViperUseCaseOutput
        presenter.output = viewController as? Presenter.ViperPresenterOutput
    }
    
    
    static func createUseCase<T>(useCaseType: T.Type, entityGateway: EntityGateway ) -> T where T : ViperUseCase {
        return useCaseType.init(entityGateway: entityGateway)
    }

    static func createPresenter<T>(presenterType: T.Type, useCase: T.ViperUseCase ) -> T where T : ViperPresenter {
        return presenterType.init(useCase: useCase)
    }
    
}

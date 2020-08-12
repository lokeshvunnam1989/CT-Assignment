//
//  HomeAssembly.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class HomeAssembly: NSObject, CTAssemblyProtocol {
    
    required override init() {
        super.init()
    }
    
    func assemblyModule() -> UIViewController {
        
        return self.viewControllerForHome()
    }
    
    fileprivate func viewControllerForHome() -> HomeViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Constants.Main, bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.HomeVC) as? HomeViewController
        viewController?.presenter = self.presenterModuleWithVC(controller: viewController!)
        
        return viewController!
    }
    
    fileprivate func presenterModuleWithVC(controller: HomeViewController) -> HomePresenter {
        let presenter = HomePresenter()
        presenter.userInterface = controller
        presenter.interactor = self.interactorModuleWithPresenter(presenter: presenter)
        presenter.router = self.RouterModuleWithController(controller: controller)
        
        return presenter
    }
    
    fileprivate func interactorModuleWithPresenter(presenter: HomePresenter) -> HomeInteractor {
        let interactor = HomeInteractor()
        interactor.presenter = presenter
        
        return interactor
    }
    
    fileprivate func RouterModuleWithController(controller: HomeViewController) -> HomeRouter {
        let router = HomeRouter()
        router.transitionHandler = controller
        
        return router
    }
}

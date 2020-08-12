//
//  ArticlesAssembly.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class ArticlesAssembly: NSObject, CTAssemblyProtocol {
   
    var input: [Article]? {
        didSet {
            self.updateInteractor()
        }
    }
    private var interactor: ArticlesInteractor?
    
    required override init() {
        super.init()
    }
    
    func assemblyModule() -> UIViewController {
        
        return self.viewControllerForList()
    }
    
    fileprivate func viewControllerForList() -> ArticlesViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Constants.Main, bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.ArticlesVC) as? ArticlesViewController
        viewController?.presenter = self.presenterModuleWithVC(controller: viewController!)

        return viewController!
    }
    
    fileprivate func presenterModuleWithVC(controller: ArticlesViewController) -> ArticlesPresenter {
        let presenter = ArticlesPresenter()
        presenter.userInterface = controller
        presenter.interactor = self.interactorModuleWithPresenter(presenter: presenter)
        
        return presenter
    }
    
    fileprivate func interactorModuleWithPresenter(presenter: ArticlesPresenter) -> ArticlesInteractor {
        interactor = ArticlesInteractor()
        interactor!.presenter = presenter
        
        return interactor!
    }
    
    func updateInteractor() {
        interactor?.articles = self.input
    }
}

//
//  HomePresenter.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class HomePresenter: NSObject, HomePresenterInput, HomeInteractorOutput {
    
    weak var userInterface: HomePresenterOutput?
    var interactor: HomeInteractorInput?
    var router: HomeRouter?
    
    func fetchArticles() {
        self.interactor?.fetchArticles()
    }
    
    func showArticlesView() {
        self.router?.showArticlesView()
    }
    
    func showArticlesList(_ articles: [Article]) {
        self.router?.showArticlesList(articles)
    }
        
    func showErrorView(_ message: String) {
        print("Error: \(message)")
    }
}

//
//  ArticlesPresenter.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class ArticlesPresenter: NSObject, ArticlesPresenterInput, ArticlesInteractorOutput {

    weak var userInterface: ArticlesPresenterOutput?
    var interactor: ArticlesInteractorInput?
    
    //MARK:- ArticlesInteractorOutput
    
    func updateContent() {
        self.userInterface?.updateContent()
    }
    
    //MARK:- ArticlesPresenterInput
    
    func getArticle(_ index: Int) -> Article? {
        return self.interactor?.getArticle(index)
    }
    func getArticlesCount() -> Int {
        return (self.interactor?.getArticlesCount() ?? 0)
    }
    
}

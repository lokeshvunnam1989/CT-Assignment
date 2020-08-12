//
//  ArticlesInteractor.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class ArticlesInteractor: NSObject, ArticlesInteractorInput {

    weak var presenter: ArticlesInteractorOutput?
    var articles: [Article]? {
        didSet {
            self.presenter?.updateContent()
        }
    }
    
    func getArticle(_ index: Int) -> Article? {
        return self.articles?[index]
    }
    
    func getArticlesCount() -> Int {
        return (self.articles?.count ?? 0)
    }
    
}

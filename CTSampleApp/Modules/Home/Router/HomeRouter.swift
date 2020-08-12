//
//  HomeRouter.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class HomeRouter: NSObject, HomeRouterInput  {
    
    var transitionHandler: CTBaseViewController?
    
    let articlesAssembly = ArticlesAssembly()
    
    func showArticlesList(_ articles: [Article]) {
        articlesAssembly.input = articles
    }
    
    func showArticlesView() {
        self.transitionHandler?.pushViewController(articlesAssembly.assemblyModule(), true)
    }
}

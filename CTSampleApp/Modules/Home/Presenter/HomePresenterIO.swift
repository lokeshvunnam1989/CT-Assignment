//
//  HomePresenterIO.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

protocol HomePresenterInput {
    
    func fetchArticles()
    func showArticlesView()
}

protocol HomePresenterOutput: class {
        
}

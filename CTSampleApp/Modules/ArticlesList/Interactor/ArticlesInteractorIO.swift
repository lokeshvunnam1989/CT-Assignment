//
//  ArticlesInteractorIO.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

protocol ArticlesInteractorInput {
    
    func getArticle(_ index: Int) -> Article?
    func getArticlesCount() -> Int
}

protocol ArticlesInteractorOutput: class {
    
    func updateContent()
}

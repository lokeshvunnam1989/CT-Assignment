//
//  HomeInteractor.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation
import UIKit

class HomeInteractor: NSObject, HomeInteractorInput {
    
    weak var presenter: HomeInteractorOutput?
    
    func fetchArticles() {
        
        let connection = APIConnectionFactory.connection()
        let request = RequestFactory.routeConnectionsRequest()
        connection.sendRequest(request) { (data, error) in
            guard error == nil else {
                self.presenter?.showErrorView(error.debugDescription)
                return
            }
            
            if let data = data {
                do {
                    let articles: Articles = try JSONDecoder().decode(Articles.self, from: data)
                    self.presenter?.showArticlesList(articles.data)
                } catch {
                    self.presenter?.showErrorView(error.localizedDescription)
                }
            }
        }
    }
}

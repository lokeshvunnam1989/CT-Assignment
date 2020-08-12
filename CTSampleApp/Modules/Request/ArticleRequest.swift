//
//  ArticleRequest.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class ArticleRequest: IRequest {
    
    override func apiEndpoint() -> String {
        return "response.json"
    }
    
    override func methodType() -> HTTPMethod {
        return .get
    }
}

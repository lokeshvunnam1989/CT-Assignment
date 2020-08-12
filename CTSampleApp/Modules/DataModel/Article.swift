//
//  Article.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

struct Articles: Codable {
    let data: [Article]
}

struct Article: Codable {
    let metaData: MetaData
    let id: String
    let title: String
    let imageUrl: String
    let isSaved: Bool
    let isLiked: Bool
    let likesCount: Int
    let category: String
    let author: Author
    
    struct MetaData: Codable {
        let creationTime: String
        let updateTime: String
    }
    
    struct Author: Codable {
        let id: String
        let authorName: String
        let authorAvatar: AuthorAvatar
        
        struct AuthorAvatar: Codable {
            let imageUrl: String
        }
    }
}

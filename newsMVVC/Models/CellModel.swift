//
//  CellModel.swift
//  newsMVVC
//
//  Created by User on 22.12.2020.
//

import Foundation
class CellModel: CellModelProtocol, WebProtocol {
    var currentArticle: Article
    var author: String? {
        return currentArticle.source?.name
    }
    var title: String?{
        return currentArticle.title
    }
    var articleDescription: String? {
        return currentArticle.articleDescription
    }
    var url: String? {
        return currentArticle.url
    }
    var urlToImage: String? {
        return currentArticle.urlToImage
    }
    init (currentArticle: Article) {
        self.currentArticle = currentArticle
    }
}

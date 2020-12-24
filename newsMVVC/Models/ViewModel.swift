//
//  ViewModel.swift
//  newsMVVC
//
//  Created by User on 22.12.2020.
//

import Foundation
class ViewModel: NSObject {
    
    var key = Sources()
    var article: [Article]?
    var fetchDataManager = FeatchDataManager()
            
    func dataRecive(complession: @escaping ([Article]) ->()) {
        fetchDataManager.fetcherArticle(header: key.header, url: key.url) {  (Article) in
            self.article = Article?.articles
            complession(Article!.articles)
        }
    }
        
    func cellConfigure(indexPath: IndexPath) -> CellModelProtocol? {
        guard let article = article else {return nil}
        let currentArticle = article[indexPath.row]
        return CellModel(currentArticle: currentArticle)
    }
    
    func numberOfSection() -> Int{
        guard let article = article else {return 0}
        return article.count
    }
    
    func currentCell(indexPath: IndexPath) -> WebProtocol {
        let currentArticle = article?[indexPath.row]
        return CellModel(currentArticle: currentArticle!)
        
    }
    func webView(currentArticle: WebProtocol)-> URLRequest?{
        guard let url = URL(string: currentArticle.url ?? "") else {return nil}
        let request = URLRequest(url: url)
        return request
    }
}

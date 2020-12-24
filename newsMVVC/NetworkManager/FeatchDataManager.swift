//
//  FeatchDataManager.swift
//  newsMVVC
//
//  Created by User on 22.12.2020.
//

import Foundation
class FeatchDataManager {
    var fetchDataModel = FetchDataModel()
    
    func fetcherArticle(header: [String: String], url: String, closure: @escaping (ParseModel?) -> ()) {
        fetchDataModel.parseJsonData(header: header, url: url , clousureResponce: closure)
    }
}

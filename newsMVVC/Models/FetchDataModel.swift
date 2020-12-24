//
//  FetchDataModel.swift
//  newsMVVC
//
//  Created by User on 22.12.2020.
//

import Foundation
class FetchDataModel: NSObject {
    
    var networkManager = NetworkManager()
    
    func parseJsonData<T: Decodable> ( header: [String: String],url: String,clousureResponce: @escaping (T?) -> ()){
            networkManager.getArticles(header: header, url: url) { (data) in
                let jsonDecoder = JSONDecoder()
                guard let jsonData = try? jsonDecoder.decode(ParseModel.self, from: data!) else {return}
                clousureResponce(jsonData as? T)
            } closureEror: { (Error) in
                print (Error?.localizedDescription as Any)
            }
    
        }

}





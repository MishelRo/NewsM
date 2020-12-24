//
//  NetworkManager.swift
//  newsMVVC
//
//  Created by User on 22.12.2020.
//

import Foundation
class NetworkManager: NSObject {
    var key = Sources()
   func getArticles( header: [String: String],url: String, clousureResponce: @escaping (Data?) -> (),closureEror: @escaping (Error?) -> () ) {
        let headers = header
        let postData = NSData(data: "".data(using: String.Encoding.utf8)!)
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        let dataTask = createDataTask(from: request as URLRequest, complession: clousureResponce)
        dataTask.resume()
    }
    
    internal func createDataTask ( from request: URLRequest, complession: @escaping (Data) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, responce, error) in
            if (error != nil) {
                print (error?.localizedDescription as Any)
            } else {
                complession(data!)
            }
        }
    }
}

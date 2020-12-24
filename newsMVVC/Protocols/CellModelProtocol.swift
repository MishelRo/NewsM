//
//  CellModelProtocol.swift
//  newsMVVC
//
//  Created by User on 22.12.2020.
//

import Foundation
protocol CellModelProtocol {
    var author: String? {get}
    var title: String?{get}
    var articleDescription: String?{get}
    var url: String? {get}
    var urlToImage: String? {get}
}

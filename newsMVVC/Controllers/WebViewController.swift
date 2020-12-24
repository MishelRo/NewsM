//
//  WebViewController.swift
//  newsMVVC
//
//  Created by User on 23.12.2020.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    var address: URLRequest?
    @IBOutlet weak var webViews: WKWebView!
    
    func loadWeb(url: URLRequest){
        webViews.load(url)
    }
    
    override func viewDidLoad() {
        guard let url = address else {return}
        loadWeb(url: url)
        super.viewDidLoad()
    }

}

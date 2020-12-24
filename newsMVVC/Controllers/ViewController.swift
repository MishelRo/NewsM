//
//  ViewController.swift
//  newsMVVC
//
//  Created by User on 23.12.2020.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    var viewModel = ViewModel()
    var url: URLRequest?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.isHidden = true
        super.viewDidLoad()
        viewModel.dataRecive { (Article) in
            DispatchQueue.main.async {
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cellValue = viewModel.cellConfigure(indexPath: indexPath)
        cell.cellModel = cellValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = viewModel.currentCell(indexPath: indexPath)
        guard let url = viewModel.webView(currentArticle: currentCell) else {return}
        let webViewController = WebViewController(nibName: "WebViewController", bundle: nil)
        webViewController.address = url
        self.present(webViewController, animated: true, completion: nil)
    }
    
}

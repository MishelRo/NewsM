//
//  TableViewCell.swift
//  newsMVVC
//
//  Created by User on 22.12.2020.
//

import UIKit
import SDWebImage
class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLablel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    var cellModel: CellModelProtocol! {
        willSet(article) {
            self.authorLablel.text = article.author
            self.titleLabel.text = article.title
            self.imageLabel.sd_setImage(with:  URL(string: article.urlToImage ?? ""), completed: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

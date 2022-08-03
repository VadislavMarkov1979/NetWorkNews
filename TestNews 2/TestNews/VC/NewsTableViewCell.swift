//
//  NewsTableViewCell.swift
//  TestNews
//
//  Created by Владимир Макаров on 17.02.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourseLabel: UILabel!
    @IBOutlet weak var launguadgeLabel: UILabel!
    
    func configure(with label: Result) {
        titleLabel.text = label.title
        dateLabel.text = label.pubDate
        sourseLabel.text = label.sourceID
        launguadgeLabel.text = label.language
        
        guard let url = URL(string: label.imageURL ?? "") else { return }
//        переходим в глобальный поток
        DispatchQueue.global().async {
//            делаем сетевой запрос в глобальном потоке. И получаем картинку
            guard let imageData = try? Data(contentsOf: url) else { return }
//            переходим в главный поток. И отображаем картинку
            DispatchQueue.main.async {
                self.imageCell.image = UIImage(data: imageData)
            }
        }
    }
    
}

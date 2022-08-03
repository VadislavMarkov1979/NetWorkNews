//
//  NewsTableViewController.swift
//  TestNews
//
//  Created by Владимир Макаров on 17.02.2022.
//

import UIKit
import Alamofire


class NewsTableViewController: UITableViewController {
    
    @IBOutlet weak var indecator: UIActivityIndicatorView!
    
    let netWorkManager = NetWorkManager()
    var newsData: CurrentNewsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        indecator.startAnimating()
        indecator.hidesWhenStopped = true
        title = "NewsSpors"
        netWorkManager.alamofireGetRequest { data in
            DispatchQueue.main.async {
                self.newsData = data
                self.tableView.reloadData()
                self.indecator.stopAnimating()
            }
            
        }
        
//        netWorkManager.postRequestWithDict()
//        netWorkManager.postRequestWithModel()
//        netWorkManager.alamofireGetRequest { currentNewsData in
//            self.newsData = currentNewsData
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//                self.indecator.stopAnimating()
//            }
//        }
        
//        netWorkManager.fetchNews { currentNewsData in
//            self.newsData = currentNewsData
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//                self.indecator.stopAnimating()
//            }
//        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData?.results.count ?? 0
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        let label = newsData?.results[indexPath.row]
        cell.configure(with: label!)
        return cell
    }

}
//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}

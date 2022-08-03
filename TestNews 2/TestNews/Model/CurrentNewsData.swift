//
//  CurrentNewsData.swift
//  TestNews
//
//  Created by Владимир Макаров on 18.02.2022.
//

import Foundation

struct CurrentNewsData: Codable {
    var results: [Result]
    
    init(value: [String: Any]) {
        let resultsArray = value["results"] as? [String: Any] ?? [:]
        results = [Result(value: resultsArray)]
        
    }
    func getNews(from value: Any) -> [CurrentNewsData]? {
        guard let value = value as? [String: Any] else { return []  }
        guard let currentNewsData = value["currentNewsData"] as? [[String: Any]] else { return [] }
        return currentNewsData.compactMap { CurrentNewsData(value: $0) }
    }
}

struct Result: Codable {
    let title: String?
    let pubDate: String?
    let fullDescription: String?
    let imageURL: String?
    let sourceID: String?
    let language: String?
    
    init(value: [String: Any]) {
        title = value["title"] as? String ?? ""
        pubDate = value["pubDate"] as? String ?? ""
        fullDescription = value["full_description"] as? String ?? ""
        imageURL = value["image_url"] as? String ?? ""
        sourceID = value["source_id"] as? String ?? ""
        language = value["language"] as? String ?? ""
    }
    
//    enum CodingKeys: String, CodingKey {
//        case title
//        case pubDate
//        case language
//        case fullDescription = "full_description"
//        case imageURL = "image_url"
//        case sourceID = "source_id"
//    }
}

//struct CourseV3: Codable {
//    let name: String
//    let imageUrl: String
//    let numberOfLessons: String
//    let numberOfTests: String
//}


//
//  NetWorkManager.swift
//  TestNews
//
//  Created by Владимир Макаров on 17.02.2022.
//

import Foundation
import Alamofire

struct NetWorkManager {
    
    let urlAF = "https://newsdata.io/api/1/news?apikey=pub_4295698524d3396d2c003145bfb797d79969&category=sports,health"
    static let shared = NetWorkManager()
//    var newsData: [CurrentNewsData]?
    
//    func fetchNews(_ completion: @escaping (CurrentNewsData) -> Void) {
//        let urlString = "https://newsdata.io/api/1/news?apikey=pub_4295698524d3396d2c003145bfb797d79969&category=sports,health"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error { print(error); return }
//            guard let data = data else { return }
//
//            do {
//                let currentNewsData = try JSONDecoder().decode(CurrentNewsData.self, from: data)
//                completion(currentNewsData)
//            } catch let error as NSError {
//                print(error)
//            }
//        }.resume()
//    }
    
    
    func alamofireGetRequest(_ completion: @escaping (CurrentNewsData) -> Void) {
        let request = AF.request(urlAF)
        request.validate()
        request.responseDecodable(of: CurrentNewsData.self) { (response) in
            switch response.result {
            case .success(let success):
                completion(success)
            case .failure(let error):
                print("👾👾👾👾👾👾👾")
                print(error)
                print("👾👾👾👾👾👾👾")
            }
        }
        
    }

//     Передача данных на сервер из словаря не создавая модели данных
//    Чаще всего, данные передаются из модели на сервер.
    
//    func postRequestWithDict() {
////        создаем url
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
//
////        создаем словарь, что данных, которые будем отправлять на сервер. Все данные, которые передаются, дожны быть типа  String
//        let courses = [
//            "name": "Networking",
//            "imageUrl": "image url",
//            "numberOfLessons": "10",
//            "numberOfTests": "8"
//        ]
//
////        словарь передавать на сервер нельзя, так как словарь это тип языка программирования. По этому, на сервер передают JSON
////        что бы из словаря сделать данные типа Data, используют класс JSONSerialization. Этот метот позволяет создать файл JSON из словаря
//        guard let courseData = try? JSONSerialization.data(withJSONObject: courses, options: []) else { return }
//
////        создаем тип URLRequest. Потому как сам URLRequest потому как он содержит больше, чем просто url
////        URLRequest это структура, по этому нужно создать экземпляр
//        var request = URLRequest(url: url)
//
////        наполняем объект request.
////        определяем тип запроса. Т е POST запрос
//        request.httpMethod = "POST"
//
////        определяем содержимое запроса. Т е что передаем
//        request.httpBody = courseData
//
////        задаем правила отображения контента для сервера. Если не задать эти правила, сервер не правильно отобразит данные ("ключ": "значение")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
////        Создаем сессию запроса, для отправки данных
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, let response = response else {
//                print(error)
//                return
//            }
//            print(response)
////      что бы посмотреть, что передали на сервер, необходимо получить JSON файл через JSONSerialization.jsonObject
//            do {
//                let course = try JSONSerialization.jsonObject(with: data, options: [])
////                print(course)
//            } catch let error {
////                print(error)
//            }
//        }.resume()
//    }
//
//    //        Передача данных на сервер с помощью модели
//
//    func postRequestWithModel() {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
//
////            Создаем экземпляр модели CourseV3
//        let course = CourseV3(
//            name: "Networking",
//            imageUrl: "image url",
//            numberOfLessons: "65",
//            numberOfTests: "40"
//        )
//
////            Для конвертации структуры в JSON используется JSONEncoder().encode
//        guard let courseData = try? JSONEncoder().encode(course) else { return }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = courseData
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            guard let data = data else {
//                print(error)
//                return
//            }
//
//            do {
//                let course = try JSONDecoder().decode(CourseV3.self, from: data)
//                print(course)
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }
//
    
    
//    func fetchNews(_ completion: @escaping (CurrentNewsData) -> Void) {
////       создаем свойство, которому присваиваем url - адрес
//        let urlString = "https://newsdata.io/api/1/news?apikey=pub_4295698524d3396d2c003145bfb797d79969&category=sports,health"
////       создаем инициализатор, который создает уже url и безопасно извлекаем
//        guard let url = URL(string: urlString) else { return }
//        let session = URLSession(configuration: .default)
////        создаем запрос данных к серверу с помощью dataTask
//        let task = session.dataTask(with: url) { data, response, error in
////            проверяем, получили ли мы данные. И если получили, записываем в data и печаем в консоль для проверки
//            if let data = data {
////                let dataString = String(data: data, encoding: .utf8)
////                print(dataString)
////                Вызываем метод для парсинга JSON. Так как работаем внутри клоужера, нужно перед методом поставить self. И в параметрах передаем данные data. Полученные данные из JSON проверяем на наличие и созраняем в currentNews
//                let currentNewsJSON = self.parseJSON(withData: data)
//                guard let currentNews = currentNewsJSON else { return }
////                Сохраненные данные из JSON передаем в completion блок
//                completion(currentNews)
//            }
//        }
////        вызываем resume(), потому что вызывая dataTask. Он в подвешенном состоянии. И что бы он начал свою работу и произошел запрос вызываем resume
//        task.resume()
//    }
////    Функци парсинга JSON (раскладываем полученные данные по модели CurrentNewsData). Функци принимает данные data типа Data
//    func parseJSON(withData data: Data) -> CurrentNewsData? {
////        Создаем декодер, для декодирования данных
//        let decoder = JSONDecoder()
////        JSON decoder, раскодируя информацию, должен вернуть объект CurrentNewsData. Когда работаем с методом decode, необходимо использвать try-catch
//        do {
////        создаем объект currentNews
//        let currentNewsData = try decoder.decode(CurrentNewsData.self, from: data)
//            return currentNewsData
////            print(currentNewsData.results.count)
//        } catch let error as NSError {
//            print(error)
//        }
//        return nil
//    }

    
    
}

//
//  FetchNewModel.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/24.
//

import Foundation

class FetchModelNewsList: ObservableObject {
    @Published var items: [ModelNews] = []
    static let url = URL(string: "http://www.hdjc8.com/json/news.json")!

    func fetch() {
        URLSession.shared.dataTask(with: FetchModelNewsList.url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let modelObject = try jsonDecoder.decode(ModelNewsList.self, from: data)
                DispatchQueue.main.async {
                    self?.items = modelObject.items
                    print("Fetched items: \(self?.items ?? [])")
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

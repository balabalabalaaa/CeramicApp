import Foundation
import SwiftUI

class FetchMessageListModel: ObservableObject {
    @Published var items: [MessageListModel] = []
    static let url = URL(string: "http://www.hdjc8.com/json/message.json")!

    func fetch() {
        URLSession.shared.dataTask(with: Self.url) { (data, response, error) in
            if let error = error {
                print("Error fetching messages: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let modelObject = try jsonDecoder.decode(MessageList.self, from: data)

                DispatchQueue.main.async {
                    self.items = modelObject.items
                    print(self.items)
                }
            } catch {
                print("JSON decoding failed: \(error)")
            }
        }.resume()
    }
}

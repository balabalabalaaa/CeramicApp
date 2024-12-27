
import SwiftUI

class FetchModelQuizDetailList: ObservableObject
{
    @Published var item: ModelQuizDetail = ModelQuizDetail()
    @Published var items: [ModelQuizDetail] = []
    
    static let url = URL(string: "http://www.hdjc8.com/json/quizDetail.json")!
    
    func fetch()
    {
        URLSession.shared.dataTask(with: FetchModelQuizDetailList.url)
        { (data, response, error) in
            guard let data = data, error == nil else
            {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            let modelObject = try? jsonDecoder.decode(ModelQuizDetailList.self, from: data)
            
            DispatchQueue.main.async
            {
                self.items = modelObject!.items
                self.getItem()
                print(self.items)
            }
            
        }
        .resume()
    }
    
    func getItem()
    {
        self.item = self.items.randomElement()!
    }
}

//
//  FetchQuizModel.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/28.
//

import Foundation
import SwiftUI

class FetchQuizModel: ObservableObject
{
    @Published var items: [ModelQuiz] = []
    
    static let url = URL(string: "http://www.hdjc8.com/json/quiz.json")!
    
    func fetch()
    {
        URLSession.shared.dataTask(with: FetchQuizModel.url)
        { (data, response, error) in
            guard let data = data, error == nil else
            {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            let modelObject = try? jsonDecoder.decode(ModelQuizList.self, from: data)
            
            DispatchQueue.main.async
            {
                self.items = modelObject!.items
                print(self.items)
            }
        }
        .resume()
    }
}

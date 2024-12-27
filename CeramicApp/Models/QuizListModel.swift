import Foundation

struct ModelQuizDetailList: Codable
{
    var items : [ModelQuizDetail]
}

struct ModelQuizDetail: Codable, Hashable
{
    var question : String
    var options : [String]
    var answer : Int
    
    init(){
        question = ""
        options = ["1","2","3","4"]
        answer = 0
    }
}

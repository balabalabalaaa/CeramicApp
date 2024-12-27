import Foundation

struct ModelNewsList: Codable {
    var items: [ModelNews]
}

struct ModelNews: Codable, Hashable {
    var title: String
    var subTitle: String
    var postDate: String

    init(title: String = "", subTitle: String = "", postDate: String = "") {
        self.title = title
        self.subTitle = subTitle
        self.postDate = postDate
    }
}

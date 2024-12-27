//
//  ClassList.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/23.
//

import Foundation
class ClassListModel: NSObject
{
    var items: [RecentclassModel]
    override init() {
        self.items = [RecentclassModel]()
        let ceramicItemTitles = [
            "陶瓷历史与文化",
            "基础陶艺技能",
            "陶瓷材料科学",
            "创意陶瓷设计",
            "陶瓷修复与保养",
            "商业与市场营销",
            "环境友好型陶瓷制作",
            "儿童陶艺教育",
            "传统陶瓷技艺",
            "现代陶瓷艺术",
            "陶瓷雕塑技法",
            "釉料调配与应用",
            "窑炉烧制技术",
            "陶瓷装饰技巧",
            "陶瓷作品展示与销售",
            "陶瓷艺术鉴赏",
            "国际陶瓷交流",
            "陶瓷工艺创新",
            "陶瓷艺术品收藏",
            "陶瓷文化传承"]
        for i  in 0..<12
        {
            let item = RecentclassModel()
            item.sequence = i+1
            item.likeCount = Int.random(in: 1...10000)
            item.starCount = Int.random(in: 3...5)
            item.studyCount = Int.random(in: 12...100)
            item.title = ceramicItemTitles[Int.random(in: 0...19)]
            self.items.append(item)
        }
    }
}

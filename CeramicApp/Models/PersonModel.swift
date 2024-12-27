//
//  PersonModel.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/12/2.
//

import Foundation
struct PersonList{
    var items: [PersonModel] = []
    init(){
        items.append(PersonModel(icon: "pageHe1", title: "喜欢的课程", messageCount: 8))
        items.append(PersonModel(icon: "pageHe2", title: "我的技巧", messageCount: 9))
        items.append(PersonModel(icon: "pageHe3", title: "VIP订阅", messageCount: 0))
        items.append(PersonModel(icon: "pageHe4", title: "关于我们", messageCount: 3))
    }
}
struct PersonModel: Hashable
{
    var icon : String
    var title : String
    var messageCount : Int
}

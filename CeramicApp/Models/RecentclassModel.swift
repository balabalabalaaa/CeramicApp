//
//  Recentclass.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/23.
//

import Foundation
enum Classstatus
{
    case None, Undone, Done
}
//课程对象
class RecentclassModel: NSObject
{
    var sequence: Int
    var status: Classstatus
    var title: String
    var starCount: Int
    var studyCount: Int
    var likeCount: Int
    override init() {
        let count = Int.random(in: 1...3)
            if count == 1
            {
                self.status = .Done
            }
            else if count == 2
            {
                self.status = .None
            }
            else
            {
                self.status = .Undone
            }
        self.sequence = 1
        self.title = "基础陶艺技能"
        self.starCount = 5
        self.studyCount = 0
        self.likeCount = 0
        }
    }


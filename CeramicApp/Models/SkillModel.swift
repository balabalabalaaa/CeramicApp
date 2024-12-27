import Foundation
import SwiftUI

// 定义技巧模型
struct Skill: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let content: String
}

// 技巧数据源
let skillData: [Skill] = [
    Skill(imageName: "skill1", title: "陶土选择", content: "了解不同类型的陶土及其适用场景，选择最适合你项目的材料。"),
    Skill(imageName: "skill2", title: "手工成型技巧", content: "掌握基础的手工成型方法，如捏塑、盘筑和泥板成型。"),
    Skill(imageName: "skill3", title: "釉料应用", content: "学习如何调配和应用釉料，以实现不同的表面效果和颜色。"),
    Skill(imageName: "skill4", title: "烧制工艺", content: "探索不同的烧制温度和技术，了解它们对成品的影响。")
]

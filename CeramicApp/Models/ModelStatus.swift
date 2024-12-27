//
//  ModelStatus.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/18.
//

import Foundation
import SwiftUI
//标记一个类可以被视图或其他对象观察其属性的变化。
class ModelStatus: ObservableObject
{
    @Published var tempString = ""
}

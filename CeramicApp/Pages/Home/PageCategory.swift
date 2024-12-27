//
//  PageCategory.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/21.
//

import SwiftUI

struct PageCategory: View {
    var title: String = ""
    private let labels = [
        "陶瓷简介[33]",
        "陶瓷的历史背景[21]",
        "陶瓷制作工艺[18]",
        "陶瓷材料科学[25]",
        "现代陶瓷艺术与表现形式[19]",
        "陶瓷装饰技巧与艺术风格[26]",
        "陶瓷装饰[26]",
        "高温陶瓷烧制[23]",
        "陶瓷烧制[23]",
        "陶瓷修复技术[14]",
        "陶瓷在建筑中的应用[21]",
        "陶瓷收藏[33]",
        "先进陶瓷科技[38]",
        "陶瓷设计[20]",
        "陶瓷设计创新与实践[20]",
        "陶瓷在建筑与家居中的应用[21]",
        "先进陶瓷科技与未来展望[38]",
        "陶瓷市场趋势与消费分析[12]",
        "陶瓷展览[24]",
        "陶瓷教育[16]"
    ]
    var body: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            SubPagetopTitle(title: "\(title) 标签", subtitle: "280个课程")
                
            VStack(alignment: .leading, spacing: 12)
            {
                ForEach(0 ..< labels.count, id: \.self)
                { number in
                    
                    if number % 2 == 0
                    {
                        CategoryRowView(firstLabel: self.labels[number], secondLabel: self.labels[number + 1], sequence: number)
                    }
                }
            }
            .padding(.top, 30)
            .padding(.leading, 30)
            
            Spacer()
        }
        .modifier(SubPageContainer())
    }
}



struct CategoryRowView: View
{
    @State private var isAnimating = false
    var firstLabel = ""
    var secondLabel = ""
    var sequence = 1
    
    var body: some View
    {
        HStack
        {
            NavigationLink(destination: PageLabelList(title: firstLabel))
            {
                Text(firstLabel)
                    .modifier(CategoryLabel())
            }
            NavigationLink(destination: PageLabelList(title: secondLabel))
            {
                Text(secondLabel)
                    .modifier(CategoryLabel())
            }
        }
        .opacity(self.isAnimating ? 1 : 0)
        .animation(.spring().delay(0.2 + 0.05 * Double(sequence)), value: isAnimating)
        .onAppear
        {
            self.isAnimating = true
        }
    }
}

#Preview {
    PageCategory()
}

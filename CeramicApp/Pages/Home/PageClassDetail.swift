import SwiftUI

// 确保 Course 模型只定义一次，这里不需要重新定义
// 如果你需要在这里使用 Course 模型，请从另一个文件导入或确保它在同一个模块中定义

// 课程详情页面
struct PageClassDetail: View {
    let course: Course
    
    var body: some View {
        ScrollView { // 使用ScrollView以便内容较多时可以滚动
            VStack(alignment: .leading, spacing: 20) {
                // 课程标题
                Text(course.title)
                    .font(.largeTitle)
                    .padding([.top, .horizontal])
                
                // 课程图片
                Image(course.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                // 课程描述
                Text("课程描述")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(course.description)
                    .font(.body)
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                
                // 其他可能的内容，如章节列表、评论等
                // ...
            }
        }
        .navigationTitle("课程详情")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 预览时使用的测试数据
#Preview {
    PageClassDetail(course: Course(
        imageName: "classcailiao",
        title: "陶瓷材料与科学",
        description: "这是一门深入探讨陶瓷材料及其在现代科技中应用的课程。通过本课程的学习，您将了解陶瓷材料的基本特性、制造工艺以及其在各个领域的广泛应用。"
    ))
}

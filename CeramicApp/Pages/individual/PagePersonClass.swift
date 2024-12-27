import SwiftUI

// 定义课程模型
struct Course: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String // 添加课程描述
}

// 主页面显示课程列表
struct PagePersonClass: View {
    // 示例课程数据
    @State private var courses: [Course] = [
        Course(imageName: "classcailiao", title: "陶瓷材料与科学", description: "这是一门深入探讨陶瓷材料及其在现代科技中应用的课程。通过本课程的学习，您将了解陶瓷材料的基本特性、制造工艺以及其在各个领域的广泛应用。"),
        Course(imageName: "classjiyi", title: "陶瓷艺术与设计", description: "探索陶瓷艺术的历史和现代设计趋势，学习如何将传统技艺与当代审美相结合。")
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) { // 修改为居中对齐
            Text("我的课程")
                .font(.system(size: 24))
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                .padding(.top, 4) // 保持顶部间距一致
            
            Spacer().frame(height: 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(courses) { course in
                        NavigationLink(destination: PageClassDetail(course: course)) {
                            ZStack {
                                // 背景图片
                                Image("homeClassItemBg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140, height: 200)
                                
                                // 图片和文字竖直排列
                                VStack {
                                    Image(course.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120, height: 120)
                                    
                                    Text(course.title)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18))
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 0) // 调整文本的位置
                                }
                            }
                        }
                    }
                }
                .padding([.top, .leading], 20)
            }
        }
        Spacer()
        .padding(.top, 4)
    }
}

// 预览时使用的测试数据
#Preview {
    PagePersonClass()
}

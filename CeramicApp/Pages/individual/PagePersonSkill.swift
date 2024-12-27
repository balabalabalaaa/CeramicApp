import SwiftUI

// 个人技巧页面
struct PagePersonSkill: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(skillData) { skill in
                        SkillCard(skill: skill)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("陶瓷技巧")
        }
    }
}

// 技巧卡片视图
struct SkillCard: View {
    let skill: Skill
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(skill.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .cornerRadius(10)
            
            Text(skill.title)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(skill.content)
                .font(.body)
                .foregroundColor(.gray)
                .lineLimit(nil) // 允许多行显示
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// 预览时使用的测试数据
#Preview {
    PagePersonSkill()
}

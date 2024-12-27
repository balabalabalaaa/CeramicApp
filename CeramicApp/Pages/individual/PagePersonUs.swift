import SwiftUI

// 关于我们页面
struct PagePersonUs: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                   
                    
                    // 公司简介
                    Text("欢迎来到陶瓷APP！我们致力于为陶瓷爱好者提供一个学习和交流的平台。通过我们的应用程序，您可以探索丰富的陶瓷知识，掌握最新的制作技巧，并与全球的陶艺家互动。")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing], 20)
                    
                    // 团队介绍
                    Section(header: Text("我们的团队").font(.title2).fontWeight(.bold)) {
                        TeamMember(imageName: "member1", name: "张三", role: "首席执行官")
                            .padding(.vertical, 5)
                        TeamMember(imageName: "member2", name: "李四", role: "技术总监")
                            .padding(.vertical, 5)
                        TeamMember(imageName: "member3", name: "王五", role: "艺术总监")
                            .padding(.vertical, 5)
                    }
                    .padding(.horizontal, 20)
                    
                    // 联系方式
                    Section(header: Text("联系我们").font(.title2).fontWeight(.bold)) {
                        ContactInfo(icon: "phone", text: "电话: +86 123 4567 8910")
                            .padding(.vertical, 5)
                        ContactInfo(icon: "envelope", text: "邮箱: info@ceramicapp.com")
                            .padding(.vertical, 5)
                        ContactInfo(icon: "globe", text: "网站: www.ceramicapp.com")
                            .padding(.vertical, 5)
                    }
                    .padding(.horizontal, 20)
                    
                    // 社交媒体链接
                    Section(header: Text("关注我们").font(.title2).fontWeight(.bold)) {
                        HStack {
                            SocialMediaButton(imageName: "facebook", url: "https://facebook.com/ceramicapp")
                            SocialMediaButton(imageName: "twitter", url: "https://twitter.com/ceramicapp")
                            SocialMediaButton(imageName: "instagram", url: "https://instagram.com/ceramicapp")
                        }
                        .padding(.vertical, 10)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationTitle("关于我们")
        }
    }
}

// 团队成员视图
struct TeamMember: View {
    let imageName: String
    let name: String
    let role: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(role)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 10)
    }
}

// 联系信息视图
struct ContactInfo: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
            
            Text(text)
                .font(.body)
        }
        .padding(.horizontal, 10)
    }
}

// 社交媒体按钮视图
struct SocialMediaButton: View {
    let imageName: String
    let url: String
    
    var body: some View {
        Button(action: {
            if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }) {
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
        }
    }
}

// 预览时使用的测试数据
#Preview {
    PagePersonUs()
}

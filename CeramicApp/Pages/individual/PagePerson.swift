//
//  PagePerson.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/28.
//

import SwiftUI

struct PagePerson: View {
    // 假设 PersonList 是一个用于获取或处理个人数据的类或结构体
    private var personlist = PersonList()
    
    // 计算缩放因子，基于屏幕宽度
    private var scaleFactor: Double {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth <= 390 ? Double(screenWidth / 420) : 1.0
    }
    
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    VStack(alignment: .leading, spacing: 8) { // 增加一些间距
                        Text("乐小陶")
                            .font(.system(size: 32 * scaleFactor)) // 应用缩放因子
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.spring().delay(0.1), value: isAnimating)
                        
                        Text("10陶币")
                            .font(.system(size: 16 * scaleFactor)) // 应用缩放因子
                            .foregroundColor(.orange)
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.spring().delay(0.2), value: isAnimating)
                    }
                    .padding(.leading, 10)
                    Spacer()
                    Image("Person1")
                        .resizable()
                        .aspectRatio(contentMode: .fill) // 使用.fill来确保图像填充整个圆形区域
                        .frame(width: 100 * scaleFactor, height: 100 * scaleFactor)
                        .clipShape(Circle()) // 裁剪成圆形
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 2) // 可选：添加白色边框
                        )
                        .shadow(radius: 7)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.spring(), value: isAnimating)
                }
                Spacer()
                    .frame(height: 30)
                SubPagePerson()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.spring().delay(0.3), value: isAnimating)
                Spacer()
                    .frame(height: 60)
                ScrollView{
                    NavigationLink(destination: PagePersonClass())
                    {
                        SubPagePersonBar(model: personlist.items[0])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.spring().delay(0.4), value: isAnimating)
                    }
                    NavigationLink(destination: PagePersonSkill())
                    {
                        SubPagePersonBar(model: personlist.items[1])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.spring().delay(0.5), value: isAnimating)
                    }
                    NavigationLink(destination: PagePersonVip())
                    {
                        SubPagePersonBar(model: personlist.items[2])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.spring().delay(0.6), value: isAnimating)
                    }
                    NavigationLink(destination: PagePersonUs())
                    {
                        SubPagePersonBar(model: personlist.items[3])
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.spring().delay(0.7), value: isAnimating)
                    }
                }
                
            }
            .padding() // 给整个VStack添加一些内边距
            .onAppear {
                isAnimating = true // 在视图出现时开始动画
            }
            .scaleEffect(CGFloat(scaleFactor))
            .background(
                          Color(red: 240/255, green: 230/255, blue: 192/255, opacity: 0.54)
                              .edgesIgnoringSafeArea(.all) // 使背景色覆盖整个屏幕
                      )
        }
    }
}

struct PagePerson_Previews: PreviewProvider {
    static var previews: some View {
        PagePerson()
    }
}

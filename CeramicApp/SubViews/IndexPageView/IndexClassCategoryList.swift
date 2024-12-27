//
//  IndexClassCategoryList.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/20.
//

import SwiftUI

struct IndexClassCategoryList: View {
    var body: some View {
        VStack(alignment: .leading)
        {
            Text("陶瓷关键词")
                .font(.system(size: 16))
                .padding(.leading, 20)
                .foregroundColor(Color.init(red: 0.4, green: 0.4, blue: 0.4))
            ZStack
            {
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 209/255, green: 154/255, blue: 118/255)
                                ,  // 主色调
                                Color(red: 255/255, green: 211/255, blue: 182/255), // 增加亮度
                                Color(red: 239/255, green: 195/255, blue: 166/255)   // 轻微改变颜色分量
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing))
                    .offset(x:20, y:0)
                //添加一个滚动视图
                ScrollView(Axis.Set.horizontal,showsIndicators: false)
                {
                    HStack(alignment: .center, spacing: 30){
                        NavigationLink(destination: PageCategory(title: "历史"))
                        {
                            VStack
                            {
                                Image("Inlishi")
                                           .resizable() // 使图像可调整大小
                                           .aspectRatio(contentMode: .fit) // 保持图像的宽高比
                                           .frame(width: 60, height: 80) // 设置图像的宽度和高度
                                Text("历史")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                        }
                        
                        NavigationLink(destination: PageCategory(title: "工艺"))
                        {
                            VStack
                            {
                                Image("Ingongyi")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 80)
                                
                                Text("工艺")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                        }
                        
                        NavigationLink(destination: PageCategory(title: "科技"))
                        {
                            VStack
                            {
                                Image("Inkeji")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 80)
                                
                                Text("科技")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                        }
                        NavigationLink(destination: PageCategory(title: "产地"))
                        {
                            VStack
                            {
                                Image("Inchandi")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 80)
                                
                                Text("产地")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                        }
                        NavigationLink(destination: PageCategory(title: "展览").navigationBarHidden(true).navigationBarTitle(""))
                        {
                            VStack
                            {
                                Image("Inzhanlan")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 80)
                                
                                Text("展览")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                            .padding(.trailing, 10)
                        }
                    }
                    .padding(Edge.Set.init(arrayLiteral: .top, .bottom), 20)
                }
                .offset(x: 30, y:0)
                .cornerRadius(5)
                }
            }
        .padding(.top,10)
        }
    }

#Preview {
    IndexClassCategoryList()
}

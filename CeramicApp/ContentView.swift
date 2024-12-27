//
//  ContentView.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PageHome()
                .tabItem({
                    Image(systemName: "house.fill")
                    Text("主页")
                })
            PageTest()
                .tabItem({
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("问答")
                })
            PageHelp()
                .tabItem({
                    Image(systemName: "questionmark.bubble")
                    Text("技巧")
                })
            PagePerson()
                .tabItem({
                    Image(systemName: "person.crop.square")
                    Text("个人")
                })
        }
        // 设置 TabView 的 tint 颜色
        .tint(Color(red: 255/255, green: 166/255, blue: 173/255))
        // 设置 TabView 的背景颜色
        .toolbarBackground(
            Color(red: 240/255, green: 230/255, blue: 192/255), // 自定义颜色
            for: .tabBar // 指定为 Tab Bar
        )
        // 忽略安全区域以确保背景色覆盖整个 Tab Bar
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}

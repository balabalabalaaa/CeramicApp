//
//  IndexTopPart.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/20.
//

import SwiftUI

struct IndexTopPart: View {
    // 字符串属性和搜索框绑定
    @State private var Searchinformation: String = ""
    // 搜索框跳转
    @State var issearch: Bool = false
    // 搜索内容为空跳转警告
    @State var isalert: Bool = false
    let dismissButton = Alert.Button.default(Text("好的")){}
    // 警告窗口
    var alert: Alert {
        Alert(title: Text("提示"), message: Text("请在搜索框内输入你要查找的信息"), dismissButton: dismissButton)
    }

    var body: some View {
        HStack {
            // 导航链接到历史记录
            NavigationLink(destination: PageRecentclass()) {
                Image(systemName: "list.bullet")
                    .font(.system(size: 22))
                    .foregroundColor(Color.gray)
            }

            Spacer()
                .frame(width: 20)

            // 搜索框和导航链接
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(height: 30)

                TextField("搜索", text: $Searchinformation)
                    .padding(5)
                    .cornerRadius(5)
                    .font(.system(size: 14))

                Image(systemName: "magnifyingglass")
                    .font(.system(size: 15))
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        if self.Searchinformation.isEmpty {
                            self.isalert = true
                        } else {
                            self.issearch = true
                            self.isalert = false
                        }
                    }
                    .alert(isPresented: $isalert) {
                        alert
                    }
            }
            Spacer()
                .frame(width: 20)
            NavigationLink(destination: PageMessagesView())
            {
                Image(systemName: "3.circle.fill")
                    .foregroundColor(Color.red)
                    .font(.system(size: 24))
            }
        }
        .navigationDestination(isPresented: $issearch) {
            PageRecentclass()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .padding(.top, 0)
        .padding(.bottom, 10)
    }
}

#Preview {
    NavigationStack {
        IndexTopPart()
    }
}

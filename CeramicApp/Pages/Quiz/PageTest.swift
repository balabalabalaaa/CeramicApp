//
//  PageTest.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/26.
//

import SwiftUI

struct PageTest: View {
    @ObservedObject var model = FetchQuizModel()
    var body: some View
    {
        NavigationView
        {
            VStack(alignment: .leading, spacing: 0)
            {
                SubPagetopTitle(title: "知识问答",
                                subtitle: "回答问题来提升你的技能", withArrow: false)
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                
                if(model.items.count > 0)
                {
                    ScrollView(.vertical, showsIndicators: false)
                    {
                        ForEach(0 ..< model.items.count, id: \.self)
                        { item in
                            NavigationLink(destination: PageTestDetail())
                            {
                                SubQuizList(model: self.model.items[item], num:item)
                            }
                        }
                    }
                }
                else
                {
                    Spacer()
                }
                
            }
            .modifier(SubPageContainer())
            .background(
                            Color(red: 240/255, green: 230/255, blue: 192/255, opacity: 0.54)
                                .edgesIgnoringSafeArea(.all) // 使背景色覆盖整个屏幕
                        )
        }
        
        .onAppear(perform: model.fetch)
    }
}

#Preview {
    PageTest()
}

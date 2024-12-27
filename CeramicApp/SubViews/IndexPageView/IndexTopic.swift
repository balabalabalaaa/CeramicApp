//
//  IndexTopic.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/21.
//

import SwiftUI

struct IndexTopic: View {
    let topicsImageList = ["topic1","topic2","topic3","topic4", "topic5", "topic6"]
    let topicsNameList = ["#器物之美", "#景德镇陶瓷好玩", "#《中陶三人行》#《破卷谈》", "#佛山陶博会", "#复刻釉", "#来醴陵捡瓷器"]
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text("热门话题")
                .font(.system(size: 16))
                .padding(.leading, 20)
                .foregroundColor(Color.init(red: 0.4, green: 0.4, blue: 0.4))
                .offset(x: 0, y: 10)
            
            ScrollView(Axis.Set.horizontal, showsIndicators: false)
            {
                HStack
                {
                    ForEach(0 ..< topicsImageList.count, id: \.self)
                    { item in
                        NavigationLink(destination: PageTopic(title:"\(self.topicsNameList[item])"))
                        {
                            VStack(alignment: .leading, spacing:6){
                                Image(self.topicsImageList[item])
                                    .resizable()
                                    
                                    .frame(width: 200, height:120)
                                Text("\(self.topicsNameList[item])")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.blue)
                                   
                            }
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
            }
            .padding(.leading, 20)
        }
    }
}

#Preview {
    IndexTopic()
}

//
//  SubPagePersonBar.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/12/24.
//

import SwiftUI

struct SubPagePersonBar: View {
    var model: PersonModel
    var body: some View {
        HStack{
            Image(model.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            Text(model.title)
                .modifier(MiddleTitle())
            Spacer()
            if model.messageCount > 0
            {
                ZStack{
                    Image("pagexiaoxi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                    Text("\(model.messageCount)")
                        .foregroundStyle(.white)
                }
            }
            Image("pagejiantou")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
        }
        .padding(.init(arrayLiteral: .top, .bottom),6)
    }
}

#Preview {
    let model = PersonModel(icon: "pageHe1", title: "喜欢的课程", messageCount: 8)
    return SubPagePersonBar(model: model)
}

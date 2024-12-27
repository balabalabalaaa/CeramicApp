//
//  SubQuizList.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/28.
//

import SwiftUI

struct SubQuizList: View {
    var model : ModelQuiz
    var num : Int
    @State var isAnimating = false
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
                .frame(width : UIScreen.main.bounds.width - 40, height: 150)
            
            HStack
            {
                Spacer()
                Image(model.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.trailing, 5)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 0)
                {
                    Text(model.title)
                        .modifier(MiddleTitle())
                    
                    Text(model.subTitle)
                        .modifier(SmallText())
                        .padding(.bottom, 10)
                    
                    HStack(alignment: .top, spacing: 0)
                    {
                        VStack(alignment: .leading, spacing: 3)
                        {
                            Text("进度")
                                .modifier(SmallText())
                            
                            Text("\(model.correctRate)%")
                                .modifier(RedNumber())
                            
                            SubStar(level: model.starCount)
                                .padding(.top, 10)
                        }
                        .padding(.trailing, 10)
                        
                        VStack(alignment: .leading, spacing: 3)
                        {
                            Text("已答")
                                .modifier(SmallText())
                            
                            Text("\(model.submit)")
                                .modifier(RedNumber())
                        }
                        
                    }
                    .padding(.top, 10)
                }
                
                Spacer()
                
                Image("SubQudati")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .offset(x: 0, y: 36)
                
                Spacer()
            }
        }
        .padding(.top, 10)
        .opacity(isAnimating ? 1 : 0)
        .animation(.spring().delay(0.3 + Double(num) * 0.1), value: isAnimating)
        .onAppear
        {
            self.isAnimating = true
        }
    }
}

#Preview {
    var model = ModelQuiz()
    model.icon = "SubQulishi"
    model.title = "中国古陶瓷发展史"
    model.subTitle = "共405个问答"
    return SubQuizList(model: model, num: 1)
}

//
//  SubPagetopTitle.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/24.
//

import SwiftUI

struct SubPagetopTitle: View {
    var title: String = ""
    var subtitle: String = ""
    var withArrow = true
    @Environment(\.presentationMode) var presentationMode:
    Binding<PresentationMode>
    @State var isAnimating = false
    var body: some View {
        HStack(alignment: .top)
        {
            if withArrow
            {
                Image(systemName: "arrow.left")
                                   .font(.system(size: 20))
                                   .offset(x: 0, y: 8)
                                   .padding(.trailing, 5)
                                   .opacity(self.isAnimating ? 1 : 0)
                                   .animation(.spring().delay(0.0), value: isAnimating)
                                   .onTapGesture {
                                       // 返回上一视图
                                       self.presentationMode.wrappedValue.dismiss()
                                   }
                
            }
            VStack(alignment: .leading, spacing: 0)
            {
                Text(title)
                    .modifier(BigTitle())
                    .padding(.bottom,5)
                    .opacity(self.isAnimating ? 1 : 0)
                    .animation(.spring().delay(0.1), value: isAnimating)
                Text(subtitle)
                    .modifier(MiddleTitle())
                    .opacity(self.isAnimating ? 1 : 0)
                    .animation(.spring().delay(0.2), value: isAnimating)
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 40)
        .onAppear(perform:
                    {
            self.isAnimating = true
        })
    }
}


#Preview {
    SubPagetopTitle()
}

//
//  SubClassDetail.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/24.
//

import SwiftUI

struct SubClassDetail: View {
    var rencentclass: RecentclassModel
    @State var isAnimating = false

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10) {
                if rencentclass.status == .None {
                    Image(systemName: "circle")
                        .modifier(RedNumberSmall())
                        .offset(x: 0, y: 15)
                } else if rencentclass.status == .Done {
                    Image(systemName: "circle.fill")
                        .modifier(RedNumberSmall())
                        .offset(x: 0, y: 15)
                } else {
                    Image(systemName: "circle.lefthalf.fill")
                        .modifier(RedNumberSmall())
                        .offset(x: 0, y: 15)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text(rencentclass.title)
                        .modifier(BigTitle())
                    HStack {
                        HStack(alignment: .center, spacing: 2) {
                            ForEach(0 ..< rencentclass.starCount, id: \.self) { _ in
                                Image(systemName: "star.fill")
                            }
                            ForEach(rencentclass.starCount ..< 5, id: \.self) { _ in
                                Image(systemName: "star")
                            }
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "flame.fill")
                            Text("\(rencentclass.studyCount)")
                        }
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text("\(rencentclass.likeCount)")
                        }
                        .padding(.leading, 10)
                    }
                    .padding(.top, 18)
                    .font(.system(size: 11))
                    .modifier(MiddleTitle())
                }
                .padding(.top, 10)
                .padding(.bottom, 8)
            }
            Rectangle()
                .fill(Color.black.opacity(0.1))
                .frame(height: 1)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(x: isAnimating ? 0 : 100, y: 0)
        .animation(.spring().delay(0.3 + 0.1 * Double(rencentclass.sequence)), value: isAnimating)
        .frame(width: UIScreen.main.bounds.width - 80)
        .onAppear {
            isAnimating = true
        }
    }
}


#Preview {
    let model = RecentclassModel()
    model.title = "基础陶艺技能"
    return SubClassDetail(rencentclass:  model)
}

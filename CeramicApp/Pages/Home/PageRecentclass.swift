//
//  TutorialHistosy.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/20.
//

import SwiftUI

struct PageRecentclass: View {

    var classrencet = ClassListModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 0)
        {
            SubPagetopTitle(title: "历史课程",subtitle: "一共有20个课程")
            ScrollView{
                ForEach(classrencet.items,id: \.self)
                {
                    item in
                    NavigationLink(destination: PageClassList(), label:
                                    {
                        SubClassDetail(rencentclass: item)
                    })
                }
            }
            .padding(.top,20)
            .offset(x: 30, y: 0)
            
        }
        .modifier(SubPageContainer())
    }
}

#Preview {
    PageRecentclass()
}



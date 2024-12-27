//
//  PageClassDetail.swift
//  Ceramic
//
//  Created by 赵静怡 on 2024/11/24.
//

import SwiftUI

struct PageClassList: View {
    @EnvironmentObject var status: ModelStatus
    @State var tutorialList = ClassListModel()
    var classTitle: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SubPagetopTitle(title: classTitle, subtitle: "共有100个课程.")

            SubChapterList(parentView: self)
                .padding([.top, .bottom], 20)
                .offset(x: 27, y: 0)

            ScrollView {
                ForEach(tutorialList.items, id:\.self) { item in
                    NavigationLink(destination: PageClassDetails(tutorialTitle: item.title)) {
                        SubClassDetail(rencentclass: item)
                    }
                }
            }
            .offset(x: 30, y: 0)
        }
        .modifier(SubPageContainer())
    }

    func resetTutorialList() {
        self.tutorialList = ClassListModel()
    }
}

#Preview {
    let globalmodel = ModelStatus()
    globalmodel.tempString = "陶瓷基础"
    return  PageClassList().environmentObject(globalmodel)
}

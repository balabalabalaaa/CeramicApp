import SwiftUI

struct PageTestDetail: View {
    @ObservedObject var model = FetchModelQuizDetailList()
    
    @State private var selectedItem = -1
    @State private var totalCorrect = 0
    @State private var totalInCorrect = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            SubPagetopTitle(title: "返回", subtitle: "", withArrow: true)
            
            QuestionView(question: model.item.question)
            
            OptionsView(options: model.item.options, selectedItem: $selectedItem)
            
            ScoreView(totalCorrect: totalCorrect, totalInCorrect: totalInCorrect)
            
            ControlButtons(selectedItem: $selectedItem, totalCorrect: $totalCorrect, totalInCorrect: $totalInCorrect, model: model)
            
            Spacer()
        }
        .modifier(SubPageContainer())
        .onAppear(perform: model.fetch)
    }
}

// 提取出来的子视图
struct QuestionView: View {
    let question: String
    
    var body: some View {
        HStack {
            Text(question)
                .modifier(MiddleTitle())
                .lineLimit(nil)
                .padding(.bottom, 15)
            
            Spacer()
        }
    }
}

struct OptionItem: View {
    let text: String
    let index: Int
    @Binding var selectedItem: Int
    
    var body: some View {
        Text("\(index + 1). \(text)")
            .multilineTextAlignment(.leading)
            .modifier(TitleOption(isighlight: selectedItem == (index + 1)))
            .onTapGesture {
                selectedItem = index + 1
            }
    }
}

struct OptionsView: View {
    let options: [String]
    @Binding var selectedItem: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(0 ..< options.count, id: \.self) { number in
                OptionItem(text: options[number], index: number, selectedItem: $selectedItem)
            }
        }
    }
}

struct ScoreView: View {
    let totalCorrect: Int
    let totalInCorrect: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Text("Correct: \(totalCorrect)")
            Text("Incorrect: \(totalInCorrect)")
        }
        .modifier(SmallTitle())
        .padding(.top, 25)
    }
}

struct ControlButtons: View {
    @Binding var selectedItem: Int
    @Binding var totalCorrect: Int
    @Binding var totalInCorrect: Int
    @ObservedObject var model: FetchModelQuizDetailList
    
    var body: some View {
        HStack(spacing: 20) {
            Button("提交") {
                if model.item.answer == selectedItem {
                    totalCorrect += 1
                } else {
                    totalInCorrect += 1
                }
                selectedItem = -1
                model.getItem()
            }
            .modifier(CommonButton(isEnable: selectedItem > -1))
            .disabled(selectedItem == -1)
            
            Button("分享") {
                print("分享这个问题给朋友")
            }
            .modifier(CommonButton(isEnable: true))
        }
    }
}

#Preview {
    PageTestDetail()
}

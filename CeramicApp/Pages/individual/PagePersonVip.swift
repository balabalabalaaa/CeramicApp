import SwiftUI
struct PagePersonVip: View {
    @State private var selectedType = "年卡"
    @State private var selectedDateRange = "365天"
    @State var isAnimating = false
    private var model = VipModelList()
    
    // 辅助函数：计算截止日期
    private func calculateEndDate(for dateRange: String) -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        
        // 假设dateRange总是以"X天"的形式给出
        if let daysToAdd = Int(dateRange.dropLast(1)) { // 移除最后的"天"字并转换为整数
            guard let endDate = calendar.date(byAdding: .day, value: daysToAdd, to: currentDate) else {
                return "Invalid Date Range"
            }
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter.string(from: endDate)
        } else {
            return "Invalid Date Format"
        }
    }

    var body: some View {
        VStack {
            SubPagetopTitle(title: "VIP订阅", subtitle: "", withArrow: true)
            
            HStack(spacing: 10) {
                ForEach(model.items, id: \.self)
                { item in
                    SubPagePersonVip(item: item, isactive: self.selectedType == item.itemType)
                    .onTapGesture
                    {
                        self.selectedType = item.itemType
                        self.selectedDateRange = item.itemDateRange
                    }
                }
            }
            .opacity(isAnimating ? 1 : 0)
            .animation(.spring().delay(0.3), value: isAnimating)
            .frame(width: UIScreen.main.bounds.width - 60, height: 160, alignment: .center)
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("当前订阅:")
                    Spacer()
                    Text("\(selectedType)")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(0.4), value: isAnimating)
                
                HStack {
                    Text("截止日期:")
                    Spacer()
                    Text(calculateEndDate(for: selectedDateRange))
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(0.5), value: isAnimating)
                
                HStack {
                    Text("解锁所有教程")
                    Spacer()
                    Text("是")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(0.6), value: isAnimating)
                
                HStack {
                    Text("解锁所有测验")
                    Spacer()
                    Text("是")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(0.7), value: isAnimating)
                
                HStack {
                    Text("持续更新")
                    Spacer()
                    Text("是")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(0.8), value: isAnimating)
                
                HStack {
                    Text("个人顾问")
                    Spacer()
                    Text("是")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(0.9), value: isAnimating)
                
                HStack {
                    Text("资源")
                    Spacer()
                    Text("是")
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(1.0), value: isAnimating)
            }
            .frame(width: UIScreen.main.bounds.width - 60)
            .padding(.top, 20)
            .modifier(MiddleTitle())
            
            Spacer()
            
            VStack {
                Button("购买") {
                    print("购买所选项目")
                }
                .font(.system(size: 20))
                .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                .background(Color.init(red: 255/255, green: 123/255, blue: 109/255))
                .foregroundColor(.white)
                .cornerRadius(5)
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(1.1), value: isAnimating)
                
                HStack {
                    Button("恢复交易") {
                        print("恢复交易")
                    }
                    
                    Spacer()
                    
                    Button("隐私政策") {
                        print("隐私政策")
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 60)
                .padding(.top, 10)
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(1.2), value: isAnimating)
            }
            .modifier(MiddleTitle1())
            
            Spacer()
        }
        .modifier(SubPageContainer())
        .onAppear {
            self.isAnimating = true
        }
    }
}

#Preview {
    PagePersonVip()
}

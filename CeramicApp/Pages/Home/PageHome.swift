import SwiftUI

struct PageHome: View {
    @State var isAnimating = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                IndexTopPart()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.spring().delay(0.1), value: isAnimating)
                IndexClassCategoryList()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.spring().delay(0.2), value: isAnimating)
                IndexClassList()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.spring().delay(0.3), value: isAnimating)
                IndexTopic()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.spring().delay(0.4), value: isAnimating)
            }
            .background(
                Color(red: 240/255, green: 230/255, blue: 192/255, opacity: 0.54)
                    .edgesIgnoringSafeArea(.all) // 使背景色覆盖整个屏幕
            )
           
        }
       
        .navigationTitle("")
        .navigationBarHidden(true)
        .padding(.top, 10)
        .onAppear {
            self.isAnimating = true
        }
        .background(
            Color(red: 240/255, green: 230/255, blue: 192/255, opacity: 0.54)
                .edgesIgnoringSafeArea(.all) // 使背景色覆盖整个屏幕
        )
    }
}

#Preview {
    PageHome()
}

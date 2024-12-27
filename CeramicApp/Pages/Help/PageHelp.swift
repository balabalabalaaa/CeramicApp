import SwiftUI

struct PageHelp: View {
    @State private var newMessage: String = ""
    @State private var isPresented: Bool = false
    @State private var isAnimating: Bool = false
    
    @ObservedObject var model = FetchMessageListModel()
    
    var alert: Alert {
        Alert(title: Text("Please input something."))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            SubPagetopTitle(title: "Personal Consultant", subtitle: "Please leave a message when you meet problem", withArrow: false)
                .padding(.leading, 20)
                .padding(.bottom, 20)
            
            MessageListView(model: model)
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(0.3), value: isAnimating)
            
            MessageInputView(newMessage: $newMessage, isPresented: $isPresented, model: model)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .animation(.spring().delay(0.4), value: isAnimating)
                .alert(isPresented: $isPresented, content: { alert })
        }
        .modifier(SubPageContainer())
        .onAppear(perform: model.fetch)
        .onAppear {
            self.isAnimating = true
        }
        .background(
                      Color(red: 240/255, green: 230/255, blue: 192/255, opacity: 0.54)
                          .edgesIgnoringSafeArea(.all) // 使背景色覆盖整个屏幕
                  )
    }
}
struct MessageListView: View {
    @ObservedObject var model: FetchMessageListModel
    
    var body: some View {
        ScrollView {
            if model.items.isEmpty {
                Text("Loading...")
                    .modifier(Loading())
            } else {
                ForEach(model.items, id: \.self) { item in
                    SubPageMessage(message: item.message, isFromUser: (item.isFromUser == 1) ? true : false)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.bottom, 5)
                }
            }
        }
    }
}

struct MessageInputView: View {
    @Binding var newMessage: String
    @Binding var isPresented: Bool
    @ObservedObject var model: FetchMessageListModel
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(lineWidth: 1)
                    .fill(Color.black.opacity(0.2))
                    .frame(height: 36)
                
                TextField("New message", text: $newMessage)
                    .font(.system(size: 16))
                    .padding(8)
            }
            .padding(.trailing, 5)
            
            Image(systemName: "return")
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
                .onTapGesture {
                    if newMessage.isEmpty {
                        isPresented.toggle()
                        return
                    }
                    let item = MessageListModel()
                    model.items.insert(item, at: 0)
                    newMessage = ""
                }
        }
    }
}

#Preview {
    PageHelp()
}

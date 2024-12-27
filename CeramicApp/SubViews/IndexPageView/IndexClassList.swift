import SwiftUI

struct IndexClassList: View {
    @State var shouldPushClassList = false
    @EnvironmentObject var status : ModelStatus
    
    var classImageList = ["classcailiao", "classjiyi", "classtuxing", "classlapei", "classdiaosu", "classlishi", "classqinghua"]
    
    var calssNameList = ["陶瓷材料与科学", "陶瓷艺术与设计", "数字图形", "拉坯基础", "陶瓷装饰基础", "中外陶瓷史", "青花装饰"]
    
    var bgImageName = "homeClassItemBg"
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text("推荐课程")
                .font(.system(size: 16))
                .padding(.leading, 20)
                .foregroundColor(Color.init(red: 0.4, green: 0.4, blue: 0.4))
                .offset(x: 0, y: 16)
            
            ScrollView(Axis.Set.horizontal, showsIndicators: false)
            {
                HStack
                {
                    ForEach(0 ..< calssNameList.count, id: \.self)
                    { item in
                        NavigationLink(destination: PageClassList())
                        {
                            ZStack
                            {
                                // 背景图片
                                Image(self.bgImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140, height: 200)
                                    

                                // 图片和文字竖直排列
                                VStack
                                {
                                    Image(self.classImageList[item])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120, height: 120)
                                    
                                    Text(self.calssNameList[item])
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18))
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 0) // 调整文本的位置
                                }
                            }
                        }
                    }
                }
                .padding(Edge.Set.init(arrayLiteral: .top), 10)
            }
            .padding(.leading, 20)
        }
        .padding(.top, 4)
    }
}

#Preview {
    IndexClassList()
}

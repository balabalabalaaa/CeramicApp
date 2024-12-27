//
//  SubChapterList.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/25.
//

import SwiftUI

struct SubChapterList: View
{
    var parentView : PageClassList
    @State var selectedItem = 1
    let chapterTitles = ["陶瓷概论", "陶瓷材料", "陶瓷成型技术", "陶瓷装饰", "陶瓷烧制", "陶瓷修复与保养", "现代陶瓷艺术","陶瓷产业与市场","陶瓷应用"]
    
    var body: some View
    {
        ScrollView(.horizontal, showsIndicators: false)
        {
            HStack(spacing: 10)
            {
                ForEach(1 ..< 10)
                {item in
                    ZStack(alignment: .leading)
                    {
                        Image((item == self.selectedItem) ? "pageCD1" : "pageCD2")
                        
                        VStack(alignment: .leading, spacing: 10)
                        {
                            Text("\(self.chapterTitles[item-1])")
                                .font(.system(size: 15))
                            
                            Text("\(item)")
                                .font(.system(size: 64))
                        }
                        .offset(x: 20, y: 0)
                        .foregroundColor((item == self.selectedItem) ? .white : .gray)
                    }
                    .onTapGesture
                    {
                        self.parentView.resetTutorialList()
                        self.selectedItem = item
                    }
                }
            }
        }
    }
}


#Preview {
    SubChapterList(parentView:PageClassList())
}

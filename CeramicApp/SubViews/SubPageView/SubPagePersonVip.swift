//
//  SubPagePersonVip.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/12/25.
//

import SwiftUI

struct SubPagePersonVip: View {
    var item = VipModel(itemType: "年卡", itemPrice: 98, itemDateRange: "365天")
    var isactive = false
    
    var body: some View
    {
        ZStack
        {
            if(isactive)
            {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .fill(Color.init(red: 255/255, green: 123/255, blue: 109/255))
                
                VStack(alignment: .center, spacing: CGFloat(10))
                {
                    Text(item.itemType)
                        .modifier(VipDateTitleEnable())
                    
                    HStack(alignment: .firstTextBaseline, spacing: 5)
                    {
                        Text("¥")
                            .modifier(VipDatePriceEnable())
                        
                        Text("\(item.itemPrice)")
                            .modifier(VipDatePriceEnable())
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    
                    Text(item.itemDateRange)
                        .modifier(VipDateRangeEnable())
                }
            }
            else
            {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .fill(Color.black.opacity(0.3))
                
                VStack(alignment: .center, spacing: CGFloat(10))
                {
                    Text(item.itemType)
                        .modifier(VipDateTitleDisable())
                    
                    HStack(alignment: .firstTextBaseline, spacing: 5)
                    {
                        Text("¥")
                            .modifier(VipDateCurrencyDisable())
                        Text("\(item.itemPrice)")
                            .modifier(VipDatePriceDisable())
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    
                    Text(item.itemDateRange)
                        .modifier(VipDateRangeDisable())
                }
            }
        }
    }
}

#Preview {
    SubPagePersonVip()
}

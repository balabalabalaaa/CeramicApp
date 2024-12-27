//
//  VipModel.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/12/25.
//

import Foundation

struct VipModelList
{
    var items : [VipModel] = []
    
    init()
    {
        items.append(VipModel(itemType: "年卡", itemPrice: 98, itemDateRange: "365天"))
        items.append(VipModel(itemType: "季卡", itemPrice: 30, itemDateRange: "90天"))
        items.append(VipModel(itemType: "月卡", itemPrice: 12, itemDateRange: "30天"))
    }
}

struct VipModel : Hashable
{
    var itemType : String
    var itemPrice : Int
    var itemDateRange : String
}



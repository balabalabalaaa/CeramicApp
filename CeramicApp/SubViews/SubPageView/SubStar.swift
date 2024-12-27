//
//  SubStar.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/28.
//

import SwiftUI

struct SubStar: View {
    var level = 3
    
    var body: some View
    {
        HStack(alignment: .center, spacing: 0)
        {
            ForEach(0 ..< level, id: \.self)
            { item in
                Image(systemName: "star.fill")
                .modifier(LittleStar())
            }
            ForEach(0 ..< (5-level), id: \.self)
            { item in
                Image(systemName: "star")
                .modifier(LittleStar())
            }
        }
    }
}

#Preview {
    SubStar()
}

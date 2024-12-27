//
//  SubPagePerson.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/12/3.
//

import SwiftUI

struct SubPagePerson: View {
    var body: some View
    {
        HStack
        {
            ZStack(alignment: .bottomLeading)
            {
                Image("subpe1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .frame(width: 120)
            }
            ZStack(alignment: .bottomLeading)
            {
                Image("subpe2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .frame(width: 120)
                   
            }
            ZStack(alignment: .bottomLeading)
            {
                Image("subpe3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .frame(width: 120)
                   
            }
        }
    }
}

#Preview {
    SubPagePerson()
}

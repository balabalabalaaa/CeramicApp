//
//  CeramicAppApp.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/11/24.
//

import SwiftUI

@main
struct CeramicAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ModelStatus())
        }
    }
}

import SwiftUI

struct PageClassDetails: View {
    var tutorialTitle: String

    var body: some View {
        Text(tutorialTitle)
    }
}

#Preview {
    PageClassDetails(tutorialTitle: "基础陶艺技能")
}

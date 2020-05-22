
import SwiftUI

struct Editor: View {

    private let font = NSFont.monospacedSystemFont(ofSize: 17, weight: .light)

    private let text: Binding<String>
    init(text: Binding<String>) {
        self.text = text
    }

    var body: some View {

        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            TextView(text: text, font: font)
                .padding()
        }
    }
}
